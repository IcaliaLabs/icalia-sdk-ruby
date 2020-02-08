# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCodeMergeRequest
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `CodeMergeRequestEvent` object that can be used to create or
  # update a code-repository data
  class DeserializableCodeMergeRequest < DeserializableResource
    include DeserializableResourceTimestamps

    attributes :number, :provider, :body, :state, :title, :url, :additions, :deletions

    attribute(:'id-at-provider') { |value| Hash[id_at_provider: value] }
    attribute(:'added-line-count') { |value| Hash[added_line_count: value] }
    attribute(:'deleted-line-count') { |value| Hash[deleted_line_count: value] }
    attribute(:'changed-line-count') { |value| Hash[changed_line_count: value] }

    has_one :author do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[author: stand_in]
    end

    has_one :base do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[base: stand_in]
    end

    has_one :head do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[head: stand_in]
    end

    has_one :committer do |rel, id, type|
      next Hash[committer: nil] unless rel[:data].present?
      
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[committer: stand_in]
    end
  end
end
