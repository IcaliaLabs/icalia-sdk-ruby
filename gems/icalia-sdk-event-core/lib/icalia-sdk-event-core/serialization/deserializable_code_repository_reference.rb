# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCodeRepositoryReference
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia `CodeRepositoryReference` object
  class DeserializableCodeRepositoryReference < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity # id and type

    attributes :name, :label

    has_one(:commit) do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[commit: stand_in]
    end
  end
end