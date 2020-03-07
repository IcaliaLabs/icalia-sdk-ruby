# frozen_string_literal: true

module Icalia::Event
  module TopicMessageProcessing
    extend ActiveSupport::Concern

    mattr_reader :worker_mappings, default: {}

    def self.empty_mappings?
      Icalia::Event::TopicMessageProcessing.worker_mappings.empty?
    end

    module ClassMethods
      def process_from_topics(*topic_names)
        topic_names.each do |topic_name|
          Icalia::Event::TopicMessageProcessing
            .worker_mappings[topic_name] = self
        end
      end

      alias process_from_topic process_from_topics
    end
  end
end
