# frozen_string_literal: true

module Icalia
  class Organization < ModelBase
    include ResourceTimestamps
    attr_reader :name
  end
end
