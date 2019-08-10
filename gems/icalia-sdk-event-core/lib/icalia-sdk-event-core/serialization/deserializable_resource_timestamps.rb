# frozen_string_literal: true

module Icalia::Event
  module DeserializableResourceTimestamps
    extend ActiveSupport::Concern

    included do
      include DeserializableResourceCreationTimestamp
      attribute(:'updated-at') { |value| Hash[updated_at: value] }
    end
  end
end
