# frozen_string_literal: true

module Icalia
  # ModelProxy: Acts as a stand-in for an associated model, which may be
  # awaiting for de-serialization at the time the parent object was being 
  # de-serialized
  class ModelProxy
    include ResourceIdentity

    def initialize(id:, type:)
      @id = id
      @type = type
    end
  end
end
