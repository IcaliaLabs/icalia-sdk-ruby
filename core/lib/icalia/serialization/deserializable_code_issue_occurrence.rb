# frozen_string_literal: true

module Icalia
  #= DeserializableCodeIssueOccurrence
  #
  # Converts a JSONAPI.org serialization of a `CodeIssueOcurrence` object
  # notification into an `ActionController::Parameters` object that can be used
  # to create or update repo data
  class DeserializableCodeIssueOccurrence < DeserializableResource
    has_one(:'check-run') { |_rel, id, _type| Hash[check_run_unique_id: id] }

    has_one(:issue) { |_rel, id, _type| Hash[code_issue_id: id] }
  end
end
