# frozen_string_literal: true

module Icalia::Event
  #= DeserializableOrganization
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `Organization` object
  class DeserializableOrganization < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity   # id and type
    include DeserializablePropertyResource   # has one owner
    include DeserializableResourceTimestamps # created_at and updated_at

    attributes :name
  end
end
