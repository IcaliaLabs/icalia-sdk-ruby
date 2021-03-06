# frozen_string_literal: true

module Icalia
  module DeserializableResourceCreationTimestamp
    extend ActiveSupport::Concern

    included do
      attribute(:'created-at') { |value| Hash[created_at: Time.parse(value)] }
    end
  end
end
