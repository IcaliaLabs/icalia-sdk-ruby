# frozen_string_literal: true

module Icalia
  module ResourceAction
    extend ActiveSupport::Concern
    
    included do
      attr_reader :action, :timestamp
      has_one :actor
    end
  end
end
