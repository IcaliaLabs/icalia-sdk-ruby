# frozen_string_literal: true

require 'aws-sdk-sns'

module Icalia::Event
  class Publisher

    class UnknownTopicError < StandardError
    end

    class << self
      def instance
        @instance ||= new
      end

      delegate :publish, to: :instance
    end

    attr_reader :sns_client

    def initialize
      @sns_client = Aws::SNS::Resource.new Icalia::Event.sns_client_options
    end

    def publish(topic_name, data, json_data: true)
      raise UnknownTopicError, "Topic '#{topic_name}' does not exist" \
        unless topic_exists?(topic_name)

      topic = get_topic topic_name
      topic.publish message: (json_data ? json_encode(data) : data)
    end

    delegate :encode, to: ActiveSupport::JSON, prefix: :json

    protected

    def get_topic(topic_name)
      sns_client.topics.detect do |topic|
        topic.arn.split(':').last == topic_name
      end
    end

    def topic_exists?(topic_name)
      get_topic(topic_name).present?
    end
  end
end
