# frozen_string_literal: true

module Icalia::Event
  #= DeserializableOauthApplication
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia OAuth Application
  class DeserializableOauthApplication < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceTimestamps

    attributes :name
  end
end
