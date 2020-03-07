# frozen_string_literal: true

module Icalia
  class OAuthAccessToken < ModelBase
    attr_reader :scopes, :created_at, :expires_at

    has_one :application, :resource_owner
  end
end
