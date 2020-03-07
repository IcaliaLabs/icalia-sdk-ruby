# frozen_string_literal: true

module Icalia
  class CodeMergeRequestEvent < ModelBase
    include ResourceAction
    attr_reader :merge_request

    def opened?; action == 'opened'; end
    def updated?; action == 'updated'; end
    def merged?; action == 'merged'; end
    def declined?; action == 'declined'; end
  end
end
