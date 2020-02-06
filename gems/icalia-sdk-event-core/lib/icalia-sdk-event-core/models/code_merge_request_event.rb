# frozen_string_literal: true

module Icalia
  class CodeMergeRequestEvent < ModelBase
    include ResourceAction
    attr_reader :merge_request

    def closed?; action == 'closed'; end
  end
end
