# frozen_string_literal: true

module Icalia
  class CodeCommit < ModelBase
    attr_reader :sha

    attr_reader :repository
  end
end
