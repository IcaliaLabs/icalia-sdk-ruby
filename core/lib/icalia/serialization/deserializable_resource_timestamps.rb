# frozen_string_literal: true

module Icalia
  module DeserializableResourceTimestamps
    extend ActiveSupport::Concern

    included do
      include DeserializableResourceCreationTimestamp
      attribute(:'updated-at') { |value| Hash[updated_at: Time.parse(value)] }
    end
  end
end
