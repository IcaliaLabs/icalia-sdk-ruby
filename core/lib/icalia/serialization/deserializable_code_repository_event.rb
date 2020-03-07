# frozen_string_literal: true

module Icalia
  #= DeserializableCodeRepositoryEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `CodeRepositoryEvent` object that can be used to create or
  # update a code-repository data
  class DeserializableCodeRepositoryEvent < DeserializableResource
    include DeserializableResourceAction
    include DeserializableResourceCreationTimestamp

    attributes :name

    attribute(:branch) { |value| Hash[head_branch: value] }
    attribute(:'commit-sha') { |value| Hash[head_sha: value] }

    attribute :status do |value|
      case value
      when 'started' then Hash[status: 'in_progress']
      when 'finished', 'failed', 'cancelled' then Hash[status: 'completed']
      else Hash[status: 'queued']
      end
    end

    attributes :conclusion, :output

    attribute(:'created-at') { |value| Hash[created_at: value] }
    attribute(:'started-at') { |value| Hash[started_at: value] }
    attribute(:'updated-at') { |value| Hash[updated_at: value] }
    attribute(:'completed-at') { |value| Hash[completed_at: value] }

    has_one :'code-repository' do |_rel, id, _type|
      Hash[tracked_repo_unique_id: id]
    end

    has_one :'check-suite' do |_rel, id, _type|
      Hash[check_suite_id: CheckSuite.where(unique_id: id).pluck(:id).last]
    end
  end
end
