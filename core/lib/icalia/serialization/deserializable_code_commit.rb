# frozen_string_literal: true

module Icalia
  #= DeserializableCodeCommit
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia `CodeCommitReference` object
  class DeserializableCodeCommit < DeserializableResource
    attributes :sha

    has_one(:repository) do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[repository: stand_in]
    end
  end
end
