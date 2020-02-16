# frozen_string_literal: true

module Icalia
  #= DeserializableCodeRepositoryReference
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia `CodeRepositoryReference` object
  class DeserializableCodeRepositoryReference < DeserializableResource
    attributes :name, :label

    has_one(:commit) do |_rel, id, type|
      Hash[commit: get_stand_in(id: id, type: classify_type(type))]
    end
  end
end
