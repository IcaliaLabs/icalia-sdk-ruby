# frozen_string_literal: true

require 'active_model'

module Icalia
  class ModelBase
    extend ActiveModel::Naming
    include ResourceIdentity

    attr_reader :serialization_context

    cattr_reader(:associated_resources) { [] }
    cattr_reader(:associated_resource_collections) { [] }

    def initialize(object_attributes = {})
      @serialization_context = object_attributes.delete :serialization_context
      
      object_attributes.each do |key, value|
        attribute_name = "#{key}".underscore
        next register_stand_in(attribute_name, value) if value.is_a? ModelProxy
        instance_variable_set("@#{attribute_name}", value)
      end
    end

    class << self
      def has_one(*associations)
        associations.each do |association|
          attr_reader association
          associated_resources << association
        end
      end

      def has_many(*associations)
        associations.each do |association|
          attr_reader association
          associated_resource_collections << association
        end
      end
    end

    private

    def register_stand_in(association, stand_in)
      instance_variable_set("@#{association}", stand_in)
      serialization_context.register_stand_in model: self,
                                              stand_in: stand_in,
                                              association: association
    end
  end
end
