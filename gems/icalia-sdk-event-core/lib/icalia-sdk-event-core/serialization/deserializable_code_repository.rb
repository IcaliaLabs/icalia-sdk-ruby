# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCodeRepository
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `CodeRepository` object
  class DeserializableCodeRepository < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity   # id and type
    include DeserializablePropertyResource   # has one owner
    include DeserializableResourceCreationTimestamp

    attributes :name, :private, :fork, :'default-branch'
  end
end
