# frozen_string_literal: true

module Icalia
  class CodeRepositoryReference < ModelBase
    include ResourceIdentity
    attr_reader :name, :label

    attr_reader :commit

    delegate :sha, :repository, to: :commit, allow_nil: true
  end
end
