# frozen_string_literal: true

module Icalia::Event
  module DeserializableResourceAction
    extend ActiveSupport::Concern

    included do
      attribute(:action) { |value| Hash[action: value] }
      attribute(:timestamp) { |value| Hash[timestamp: Time.parse(value)] }

      has_one :actor do |_rel, id, type|
        stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
        Hash[actor: stand_in]
      end
    end
  end
end
