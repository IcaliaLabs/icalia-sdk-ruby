# frozen_string_literal: true

module Icalia::Event
  module DeserializablePropertyResource
    extend ActiveSupport::Concern

    included do
      has_one :owner do |_rel, id, type|
        Hash[owner: get_stand_in(id: id, type: classify_type(type))]
      end
    end
  end
end
