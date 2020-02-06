# frozen_string_literal: true

module Icalia
  class CodeMergeRequest < ModelBase
    attr_reader :number,
                :provider,
                :id_at_provider,
                :created_at,
                :updated_at,
                :number,
                :body,
                :state,
                :title,
                :url,
                :additions,
                :deletions,
                :added_line_count,
                :deleted_line_count,
                :changed_file_count

    attr_reader :base, :head, :author, :committer

    def closed?; state == 'closed'; end
  end
end
