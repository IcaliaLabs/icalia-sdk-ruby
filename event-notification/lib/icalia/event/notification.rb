# frozen_string_literal: true

module Icalia::Event
  #= Icalia::Event::Notification
  class Notification
    attr_reader :data,
                :topic,
                :event_data,
                :included_data,
                :metadata
    
    def initialize(raw_notification)
      @data = parse_raw_notification raw_notification
    end

    def topic_arn; data.fetch :topic_arn; end
    def topic;     @topic ||= topic_arn.split(':')[5..-1].join(':'); end

    def metadata;  @metadata ||= data.dig :message, :meta; end
    def emitter;   metadata.dig :emitter; end

    def message;   data.fetch :message; end

    def event_data; @event_data ||= deserialize_data(message.fetch(:data)); end
    def action; event_data.fetch(:action, 'message'); end

    def included_data
      @included_data ||= message
      .fetch(:included)
      .each_with_object({}) do |data, included|
        included[data.slice(:id, :type)] = deserialize_data(data)
      end
    end

    def fetch_data(property_name)
      fetched_property = fetch_attribute property_name
      return fetched_property if fetched_property.present?

      fetch_relationship property_name
    end

    delegate :parse_raw_notification, :deserialize_data, to: :class

    class << self
      delegate :decode, to: ActiveSupport::JSON, prefix: :json

      def parse_raw_notification(raw_notification)
        json_decode(raw_notification)
          .transform_keys(&:underscore)
          .tap { |parsed| parsed['message'] = json_decode parsed['message'] }
          .with_indifferent_access
      end
  
      def deserialize_data(data)
        klass = data.fetch(:type).underscore.classify
        deserializer = "Icalia::Event::Deserializable#{klass}".constantize
        deserializer.call(data).with_indifferent_access
      end
    end

    private

    def fetch_attribute(attribute_name)
      message.dig(:data, :attributes, attribute_name) ||
      message.dig(:data, :attributes, attribute_name.to_s.dasherize)
    end

    def fetch_relationship(relationship_name)
      rel = message.dig(:data, :relationships, relationship_name) ||
            message.dig(:data, :relationships, relationship_name.to_s.dasherize)
      return unless rel.present?
      included_data[rel.fetch(:data)]
    end
  end
end
