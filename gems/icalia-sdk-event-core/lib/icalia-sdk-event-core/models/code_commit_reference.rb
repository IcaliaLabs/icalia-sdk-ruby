# frozen_string_literal: true

module Icalia
  class CodeCommitReference < ModelBase
    include ResourceIdentity
    attr_reader :name, :label

    attr_reader :commit

    delegate :repository, to: :commit, allow_nil: true
  end
end
