# frozen_string_literal: true

module Icalia
  class Person < ModelBase
    include ResourceTimestamps
    attr_reader :name
  end
end
