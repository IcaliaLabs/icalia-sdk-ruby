# frozen_string_literal: true

module Icalia::Event
  class DeserializableResource < JSONAPI::Deserializable::Resource

    delegate :classify_type,
             :classify_data,
             :get_stand_in,
             :get_stand_ins,
             to: :class

    id { |value| Hash[id: value] }
    type { |value| Hash[type: classify_type(value)] }
    
    class << self
      def classify_type(type)
        type.underscore.camelize
      end

      def classify_data(data)
        classify_type data['type']
      end

      def get_stand_in(id:, type:)
        Icalia::ModelProxy.new id: id, type: type
      end

      def get_stand_ins(rel)
        if rel['data'].nil?
          Icalia::Event::ModelCollectionProxy.new rel['links']
        else
          rel['data'].map do |data|
            get_stand_in id: data['id'], type: classify_data(data)
          end
        end
      end
    end
  end
end
