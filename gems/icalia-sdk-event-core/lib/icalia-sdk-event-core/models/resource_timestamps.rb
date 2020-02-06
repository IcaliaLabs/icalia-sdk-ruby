# frozen_string_literal: true

module Icalia
  module ResourceTimestamps
    extend ActiveSupport::Concern
    
    included do
      attr_reader :created_at, :updated_at
    end
  end
end
