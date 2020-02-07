# frozen_string_literal: true

require 'icalia-sdk-event-core'

require 'active_support'
require 'active_support/core_ext/object/blank'

module Icalia
  module Event
    autoload :Version, 'icalia-sdk-event-notification/version'
    autoload :Publisher, 'icalia-sdk-event-notification/publisher'
    autoload :Subscriber, 'icalia-sdk-event-notification/subscriber'
    autoload :Notification, 'icalia-sdk-event-notification/notification'
    
    autoload :TopicMessageProcessing,
             'icalia-sdk-event-notification/topic_message_processing'

    mattr_reader :deferred_publishing, default: true
  end
end
