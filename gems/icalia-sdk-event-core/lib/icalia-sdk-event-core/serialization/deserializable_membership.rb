# frozen_string_literal: true

module Icalia::Event
  #= DeserializableMembership
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `Membership` object
  class DeserializableMembership < DeserializableResource
    include DeserializableResourceCreationTimestamp

    has_one :member do |_rel, id, type|
      Hash[member: get_stand_in(id: id, type: classify_type(type))]
    end
    
    has_one :group do |_rel, id, type|
      Hash[group: get_stand_in(id: id, type: classify_type(type))]
    end
  end
end
