# frozen_string_literal: true

module Icalia
  # ModelCollectionProxy: Acts as a stand-in for an associated model collection,
  # which may be awaiting for de-serialization at the time the parent object was
  # being de-serialized
  class ModelCollectionProxy
    
    def initialize(links: {})
      @links = links
    end
  end
end
