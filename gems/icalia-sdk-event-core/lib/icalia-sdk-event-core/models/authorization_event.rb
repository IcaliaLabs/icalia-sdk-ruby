# frozen_string_literal: true

module Icalia
  class AuthorizationEvent < ModelBase
    attr_reader :action, :timestamp

    has_one :token
  end
end
