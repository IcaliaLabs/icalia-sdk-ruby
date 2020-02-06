# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCodeMergeRequestEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `CodeMergeRequestEvent` object that can be used to create or
  # update a code-repository data
  class DeserializableCodeMergeRequestEvent < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceAction

    has_one :'merge-request' do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[merge_request: stand_in]
    end
  end
end
