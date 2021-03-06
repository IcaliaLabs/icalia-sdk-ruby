# frozen_string_literal: true

module Icalia
  #= DeserializableOauthAccessTokenEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia OAuth Access Token event
  class DeserializableOauthAccessTokenEvent < DeserializableResource
    include DeserializableResourceAction

    has_one :token do |_rel, id, type|
      Hash[token: get_stand_in(id: id, type: classify_type(type))]
    end
  end
end
