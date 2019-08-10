# frozen_string_literal: true

# Icalia::Event::EventTriggeringRecord
#
# Defines methods & behavior of ActiveRecord models that trigger events to the
# Icalia Event Bus whenever something changes on it.
#
# The specifics on how the event is generated is left to the specifics of the
# app.
module Icalia::Event
  module EventTriggeringRecord
    extend ActiveSupport::Concern

    included do
      mattr_reader :delayed_icalia_event_publishing, default: true

      after_commit :publish_create_to_icalia_events, on: :create
      after_commit :publish_update_to_icalia_events, on: :update
      after_commit :publish_destroy_to_icalia_events, on: :destroy
      
      delegate :icalia_event_class_name,
               :icalia_event_publisher_class,
               :icalia_events_publisher_method,
               :delayed_icalia_event_publishing?,
               to: :class
    end

    module ClassMethods
      def icalia_events_publisher_method
        return :perform_now unless delayed_icalia_event_publishing?
        :perform_later
      end

      def delayed_icalia_event_publishing?
        delayed_icalia_event_publishing == true
      end

      def publish_to_icalia_events_immediately!
        class_variable_set :@@delayed_icalia_event_publishing, false
      end
      
      def publish_to_icalia_events_later!
        class_variable_set :@@delayed_icalia_event_publishing, true
      end

      def icalia_event_publishing_enabled?
        :publish_to_icalia_events.in? self
          ._commit_callbacks
          .select { |callback| callback.kind.eql?(:after) }
          .map(&:filter)
      end
    
      def icalia_event_publishing_disabled?
        !icalia_event_publishing_enabled?
      end
    
      def disable_icalia_event_publishing
        skip_callback(:commit, :after, :publish_to_icalia_events)
      end
    
      def enable_icalia_event_publishing
        set_callback(:commit, :after, :publish_to_icalia_events)
      end
    
      def without_icalia_event_publishing(&_block)
        disable_icalia_event_publishing if icalia_event_publishing_enabled?
        result = yield self
        enable_icalia_event_publishing if icalia_event_publishing_disabled?
        result
      end
    
      def icalia_event_class_name
        # The default behavior is to return the class name + 'Event':
        "#{name}Event"
      end

      def icalia_event_publisher_class_name
        "IcaliaEventPublishing::Publish#{icalia_event_class_name}Job"
      end

      def icalia_event_publisher_class
        icalia_event_publisher_class_name.safe_constantize
      end
    end

    private

      def publish_to_icalia_events(action)
        publisher_class = icalia_event_publisher_class
        return unless publisher_class.present?
        publisher_class.send icalia_events_publisher_method, action.to_s, self 
      end

      def publish_create_to_icalia_events
        publish_to_icalia_events 'created'
      end

      def publish_update_to_icalia_events
        publish_to_icalia_events 'updated'
      end
      
      def publish_destroy_to_icalia_events
        publish_to_icalia_events 'destroyed'
      end
  end
end
