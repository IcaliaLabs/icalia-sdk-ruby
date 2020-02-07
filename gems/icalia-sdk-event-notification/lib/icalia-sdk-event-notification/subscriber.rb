# frozen_string_literal: true

require 'icalia-sdk-event-core'

module Icalia::Event
  module Subscriber
    extend ActiveSupport::Concern

    included do
      include Subserver::Subscriber

      mattr_reader(:topic_name) do
        self.name.demodulize.chomp('Subscriber').underscore.dasherize
      end

      mattr_reader(:processor_map) { {} }
    end

    def perform(message)
      raw_data = MessagePack.unpack(message.data)
      event = Icalia::Event::Deserializer.new(raw_data).perform
      event_class_name = event.class.name.demodulize

      if (processor_class = processor_map[event_class_name])
        (processor = processor_class.new(event, message.attributes)).perform
      else
        logger.info "There's no mapped processor for #{event_class_name}"
      end
      
      message.acknowledge!
    end

    module ClassMethods
      def subscribe_to_topic(new_topic_name, options = {})
        class_variable_set '@@topic_name', new_topic_name
        subserver_options options.merge(subscription: subscription_name)
      end

      def subscription_name
        Rails.application.class.module_parent_name.underscore +
        '-' +
        ENV.fetch('DEPLOYMENT_NAME', Rails.env).downcase +
        "-#{topic_name}"
      end

      def ensure_subscription_exists
        client = Subserver::Pubsub.client
        topic = client.topic(topic_name) || client.create_topic(topic_name)

        topic.subscription(subscription_name) ||
        topic.subscribe(subscription_name)
      end

      def process(event_class_name, options = {})
        processor = options.delete :with
        return unless processor.present?
        processor_map[event_class_name] = processor
      end
    end
  end
end
