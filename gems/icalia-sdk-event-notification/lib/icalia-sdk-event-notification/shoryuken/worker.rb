# frozen_string_literal: true

module Icalia::Event::Shoryuken
  class Worker
    include Shoryuken::Worker
    include Icalia::Event::TopicMessageProcessing

    shoryuken_options queue: 'icalia_events', auto_delete: true

    delegate :logger, to: Shoryuken

    # By default, process all notifications:
    def process_notification?(notification); true; end

    def perform(_sqs_msg, raw_notification)
      notification = Icalia::Event::Notification.new raw_notification
      
      return unless process_notification?(notification)
      
      logger.info "Processing notification from topic"\
                  " '#{notification.topic}'" #: #{notification.inspect}"
      
      # If there was no action (some events may not have an action!), we'll 
      # run the `process_message` method instead:
      action_name = notification.action || 'default'
      send "process_#{action_name.underscore}".to_sym, notification
    end

    delegate :define_noop_action_processor, to: :class

    class ActionProcessorPatternTest
      attr_reader :action_name
      
      def initialize(method_sym)
        if method_sym.to_s =~ /\Aprocess_(\w+)\z/
          @action_name = $1.to_sym
        end
      end
      
      def match?; @action_name != nil; end
    end

    def method_missing(method_sym, *arguments, &block)
      processor_test = ActionProcessorPatternTest.new(method_sym)
      
      if processor_test.match?
        define_noop_action_processor(method_sym, processor_test.action_name)
        return send(method_sym, *arguments)
      end

      super
    end

    def self.define_noop_action_processor(action_processor_method, action_name)
      return if method_defined? action_processor_method
      
      define_method action_processor_method do |*args|
        logger.info "#{self.class.name} does not know how to process " \
                    "#{action_name} - Ignoring message"
      end
    end
  end
end
