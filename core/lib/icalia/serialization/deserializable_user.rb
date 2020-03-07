# frozen_string_literal: true

module Icalia
  #= DeserializableUser
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `User` object
  class DeserializableUser < DeserializableResource
    include DeserializableResourceTimestamps

    attributes :email
  end
end
