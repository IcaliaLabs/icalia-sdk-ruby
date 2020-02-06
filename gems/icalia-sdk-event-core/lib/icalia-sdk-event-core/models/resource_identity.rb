# frozen_string_literal: true

module Icalia
  module ResourceIdentity
    extend ActiveSupport::Concern
    
    included do
      attr_reader :id, :type
    end

    def to_key
      { id: id, type: type }
    end
  end
end
