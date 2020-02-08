# frozen_string_literal: true

module Icalia
  class CodeCommit < ModelBase
    attr_reader :sha

    has_one :repository
  end
end
