# frozen_string_literal: true

module Icalia::Event
  #= DeserializablePerson
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `Person` object
  class DeserializablePerson < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceTimestamps

    attributes :name
  end
end
