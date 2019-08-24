# frozen_string_literal: true

require 'aws-sdk-sns'

require 'active_support'
require 'active_support/logger'

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

    attr_reader :sns_client, :logger

    def initialize
      set_sns_client
      set_logger
    end

    def publish(topic_name, data, json_data: true)
      raise UnknownTopicError, "Topic '#{topic_name}' does not exist" \
        unless topic_exists?(topic_name)

      topic = get_topic topic_name
      logger.debug "Publishing to '#{topic_name}': #{data.inspect}"
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

    def set_sns_client
      @sns_client = Aws::SNS::Resource.new Icalia::Event.sns_client_options
    end

    def set_logger
      return use_rails_logger if rails_logger_exist?
      use_default_logger
    end

    def rails_logger_exist?
      defined?(Rails) && Rails.logger.present?
    end

    def use_rails_logger
      @logger = Rails.logger
    end

    def use_default_logger
      @logger = ActiveSupport::Logger.new(STDOUT)
    end
  end
end
