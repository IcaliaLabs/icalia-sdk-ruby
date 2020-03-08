# frozen_string_literal: true

require 'icalia-sdk-core'

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
      event = Icalia::Deserializer.new(raw_data).perform
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
        "#{subscription_name_prefix}-#{topic_name}"
      end

      def auto_subscribe
        client = Subserver::Pubsub.client
        topic = client.topic(topic_name) || client.create_topic(topic_name)

        topic.subscription(subscription_name) ||
          topic.subscribe(subscription_name)
      end

      def process(event_class_name, options = {})
        return unless (processor = options.delete(:with)).present?

        processor_map[event_class_name] = processor
      end

      protected

      def subscription_name_prefix
        "#{rails_app_name.underscore}-#{deployment_name.underscore}"
      end

      def deployment_name
        ENV.fetch('DEPLOYMENT_NAME', Rails.env)
      end

      def rails_app_name
        return rails_app_name_since_rails_six if Rails.version.starts_with?('6')

        rails_app_name_until_rails_six
      end

      def rails_app_name_until_rails_six
        Rails.application.class.parent_name
      end

      def rails_app_name_since_rails_six
        Rails.application.class.module_parent_name
      end
    end
  end
end
