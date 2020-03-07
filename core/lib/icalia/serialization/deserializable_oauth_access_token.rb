# frozen_string_literal: true

module Icalia
  #= DeserializableOauthAccessToken
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia OAuth Access Token
  class DeserializableOAuthAccessToken < DeserializableResource
    include DeserializableResourceCreationTimestamp

    attributes :scopes
    
    attribute :'expires-at' do |value|
      parsed_value = !!value ? Time.parse(value) : nil
      Hash[expires_at: parsed_value]
    end

    attribute :'revoked-at' do |value|
      parsed_value = !!value ? Time.parse(value) : nil
      Hash[revoked_at: parsed_value]
    end

    has_one :application do |_rel, id, type|
      Hash[application: get_stand_in(id: id, type: classify_type(type))]
    end

    has_one :'resource-owner' do |_rel, id, type|
      Hash[resource_owner: get_stand_in(id: id, type: classify_type(type))]
    end
  end
end
