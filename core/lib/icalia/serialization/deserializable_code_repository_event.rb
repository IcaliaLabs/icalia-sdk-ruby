# frozen_string_literal: true

module Icalia
  #= DeserializableCodeRepositoryEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `CodeRepositoryEvent` object that can be used to create or
  # update a code-repository data
  class DeserializableCodeRepositoryEvent < DeserializableResource
    include DeserializableResourceAction

    has_one :'repository' do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[repository: stand_in]
    end
  end
end
