# frozen_string_literal: true

module Icalia::Event
  class Deserializer
    attr_reader :data

    class StandInReplacement
      attr_reader :model, :association, :stand_in
      
      def initialize(model:, association:, stand_in:)
        @model = model
        @association = association
        @stand_in = stand_in
      end
    end
    
    def initialize(jsonapi_data)
      @jsonapi_data = jsonapi_data
      @objects = {}
      @pending_stand_in_replacements = []
    end

    def perform
      return @data if @data.present?
      deserialize_included
      deserialize_data
      replace_stand_ins
      finalize
      @data
    end

    def register_stand_in(model:, association:, stand_in:)
      @pending_stand_in_replacements << StandInReplacement.new(
        model: model,
        association: association,
        stand_in: stand_in
      )
    end

    def to_s
      '(...to_s...)'
    end

    def inspect
      '(...inspect...)'
    end

    private

    def replace_stand_ins
      @pending_stand_in_replacements.each do |replacement|
        associated_object = @objects[replacement.stand_in.to_key]
        next unless associated_object.present?
        variable = "@#{replacement.association}".to_sym
        replacement.model.instance_variable_set(variable, associated_object)
      end
    end

    def finalize
      # debugger
    end

    def deserialize_included
      @jsonapi_data.fetch('included', []).each do |object_data|
        if object = deserialize_object_data(object_data)
          add_object_to_index object
        end
      end
    end

    def add_object_to_index(object)
      @objects[object.to_key] = object
    end

    def deserialize_data
      root_data = @jsonapi_data.fetch('data')
      if @data = add_object_to_index(deserialize_object_data(root_data))
        add_object_to_index @data
      end
    end

    def deserialize_object_data(object_data)
      object_class_name = object_data['type'].underscore.classify
      object_class = "::Icalia::#{object_class_name}".safe_constantize
      return unless object_class.present?
      
      deserializer_class = "::Icalia::Event::Deserializable#{object_class_name}".safe_constantize
      return unless deserializer_class.present?
      
      object_attributes = deserializer_class
        .call(object_data)
        .merge(serialization_context: self)

      object_class.new object_attributes
    end
  end
end
