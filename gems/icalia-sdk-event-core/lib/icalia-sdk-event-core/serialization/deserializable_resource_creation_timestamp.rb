# frozen_string_literal: true

module Icalia::Event
  module DeserializableResourceCreationTimestamp
    extend ActiveSupport::Concern

    included do
      attribute(:'created-at') { |value| Hash[created_at: value] }
    end
  end
end
