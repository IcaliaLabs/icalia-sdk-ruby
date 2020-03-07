# frozen_string_literal: true

module Icalia
  #= DeserializableOauthApplication
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia OAuth Application
  class DeserializableOauthApplication < DeserializableResource
    include DeserializableResourceTimestamps

    attributes :name
  end
end
