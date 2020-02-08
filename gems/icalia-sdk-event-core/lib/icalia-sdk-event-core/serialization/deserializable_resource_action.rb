# frozen_string_literal: true

module Icalia::Event
  module DeserializableResourceAction
    extend ActiveSupport::Concern

    included do
      attribute(:action) { |value| Hash[action: value] }
      attribute(:timestamp) { |value| Hash[timestamp: Time.parse(value)] }

      has_one :actor do |_rel, id, type|
        Hash[actor: get_stand_in(id: id, type: classify_type(type))]
      end
    end
  end
end
