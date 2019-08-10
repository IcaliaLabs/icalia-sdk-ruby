# frozen_string_literal: true

module Icalia::Event
  module DeserializableResourceAction
    extend ActiveSupport::Concern

    included do
      attribute(:action) { |value| Hash[action: value] }
    end
  end
end
