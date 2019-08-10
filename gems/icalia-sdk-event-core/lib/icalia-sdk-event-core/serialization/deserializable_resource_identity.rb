# frozen_string_literal: true

module Icalia::Event
  module DeserializableResourceIdentity
    extend ActiveSupport::Concern

    delegate :classify_type, to: :class

    included do
      id { |value| Hash[id: value] }
      type { |value| Hash[type: classify_type(value)] }
    end

    module ClassMethods
      def classify_type(type)
        type.underscore.camelize
      end
    end
  end
end
