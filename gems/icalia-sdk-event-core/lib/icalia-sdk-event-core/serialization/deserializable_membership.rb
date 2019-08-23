# frozen_string_literal: true

module Icalia::Event
  #= DeserializableMembership
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `Membership` object
  class DeserializableMembership < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceCreationTimestamp

    has_one :member do |_rel, id, type|
      Hash[member_id: id, member_type: classify_type(type)]
    end
    
    has_one :group do |_rel, id, type|
      Hash[group_id: id, group_type: classify_type(type)]
    end
  end
end
