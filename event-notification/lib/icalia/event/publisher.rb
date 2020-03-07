# frozen_string_literal: true

require 'google/cloud/pubsub'

require 'active_support'
require 'active_support/logger'

require 'msgpack'

module Icalia::Event
  module GRPCRailsLogger
    def logger; Rails.logger; end
  end

  module GRPCStdoutLogger
    LOGGER = ActiveSupport::Logger.new(STDOUT)
    def logger; LOGGER; end
  end

  class Publisher
    class << self
      def instance
        @instance ||= new
      end

      delegate :publish, to: :instance
    end

    attr_reader :client, :logger

    delegate :pack, to: MessagePack, prefix: :message

    def initialize
      initialize_pubsub_client
      initialize_logger
    end

    def publish(topic_name, data, attributes = {})
      logger.debug "Publishing to '#{topic_name}': #{data.inspect}"
      get_or_create_topic(topic_name).publish message_pack(data), attributes
    end

    protected

    def get_or_create_topic(topic_name)
      client.topic(topic_name) || client.new_topic(topic_name)
    end

    private

    # See https://googleapis.dev/ruby/google-cloud-pubsub/latest/file.AUTHENTICATION.html#Environment_Variables
    #
    # The environment variables that google-cloud-pubsub checks for project ID are:
    # 1. PUBSUB_PROJECT
    # 2. GOOGLE_CLOUD_PROJECT
    #
    # The environment variables that google-cloud-pubsub checks for credentials
    # are configured on Google::Cloud::PubSub::V1::Credentials:
    #
    # 1. PUBSUB_CREDENTIALS - Path to JSON file, or JSON contents
    # 2. PUBSUB_KEYFILE - Path to JSON file, or JSON contents
    # 3. GOOGLE_CLOUD_CREDENTIALS - Path to JSON file, or JSON contents
    # 4. GOOGLE_CLOUD_KEYFILE - Path to JSON file, or JSON contents
    # 5. GOOGLE_APPLICATION_CREDENTIALS - Path to JSON file
    def initialize_pubsub_client
      @client = Google::Cloud::Pubsub.new
    end

    def initialize_logger
      return use_rails_logger if rails_logger_exist?
      use_default_logger
    end

    def rails_logger_exist?
      defined?(Rails) && Rails.logger.present?
    end

    def use_rails_logger
      @logger = Rails.logger
      GRPCRailsLogger.send :extend, GRPCRailsLogger
    end

    def use_default_logger
      @logger = ActiveSupport::Logger.new(STDOUT)
      GRPCStdoutLogger.send :extend, GRPCStdoutLogger
    end
  end
end
