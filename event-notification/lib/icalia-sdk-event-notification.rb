# frozen_string_literal: true

require 'icalia-sdk-core'
require 'icalia-sdk-event-notification/version'

require 'active_support'
require 'active_support/core_ext/object/blank'

module Icalia
  module Event
    autoload :Publisher, 'icalia/event/publisher'
    autoload :Subscriber, 'icalia/event/subscriber'
    autoload :TopicMessageProcessing, 'icalia/event/topic_message_processing'

    mattr_reader :deferred_publishing, default: true
  end
end
