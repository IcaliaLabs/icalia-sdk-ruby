# frozen_string_literal: true

module Icalia
  class OrganizationEvent < ModelBase
    include ResourceAction
    
    has_one :organization

    def created?; action == 'created'; end
    def deleted?; action == 'deleted'; end
    def renamed?; action == 'renamed'; end
    def updated?; action == 'updated'; end
  end
end
