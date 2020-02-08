# frozen_string_literal: true

module Icalia::Event
  #= DeserializableOauthAccessToken
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia OAuth Access Token
  class DeserializableOauthAccessToken < DeserializableResource
    include DeserializableResourceCreationTimestamp

    attributes :scopes
    
    attribute(:'expires-at') { |value| Hash[expires_at: value] }
    attribute(:'revoked-at') { |value| Hash[revoked_at: value] }

    has_one :application do |_rel, id, type|
      Hash[application_id: id, application_type: classify_type(type)]
    end
  
    has_one :'resource-owner' do |_rel, id, type|
      Hash[resource_owner_id: id, resource_owner_type: classify_type(type)]
    end
  end
end
