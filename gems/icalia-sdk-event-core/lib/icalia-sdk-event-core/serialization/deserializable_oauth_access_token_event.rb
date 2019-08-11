# frozen_string_literal: true

module Icalia::Event
  #= DeserializableOauthAccessTokenEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia OAuth Access Token event
  class DeserializableOauthAccessTokenEvent < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceAction
    include DeserializableResourceCreationTimestamp

    has_one :token do |_rel, id, type|
      Hash[token_id: id, token_type: classify_type(type)]
    end
  end
end
