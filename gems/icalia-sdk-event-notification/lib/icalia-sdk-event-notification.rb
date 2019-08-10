# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/object/blank'

module Icalia
  module Event
    autoload :Version, 'icalia-sdk-event-notification/version'
    autoload :Publisher, 'icalia-sdk-event-notification/publisher'
    autoload :Notification, 'icalia-sdk-event-notification/notification'
    
    autoload :Shoryuken, 'icalia-sdk-event-notification/shoryuken'
    
    autoload :EventTriggeringRecord,
             'icalia-sdk-event-notification/event_triggering_record'
    
    autoload :TopicMessageProcessing,
             'icalia-sdk-event-notification/topic_message_processing'

    def self.generic_aws_client_options
      {
        region: ENV.fetch('AWS_REGION', 'us-west-2'),
        access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
      }
    end

    def self.sqs_client_options
      options = Icalia::Event.generic_aws_client_options
      return options if ENV['AWS_SQS_ENDPOINT'].blank?
      
      options.merge endpoint: ENV['AWS_SQS_ENDPOINT'], verify_checksums: false
    end

    def self.sns_client_options
      options = Icalia::Event.generic_aws_client_options
      return options if ENV['AWS_SNS_ENDPOINT'].blank?
      
      options.merge endpoint: ENV['AWS_SQS_ENDPOINT']
    end

    mattr_reader :deferred_publishing, default: true
  end
end
