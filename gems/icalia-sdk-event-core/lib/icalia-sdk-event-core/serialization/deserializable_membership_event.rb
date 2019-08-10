# frozen_string_literal: true

module Icalia::Event
  #= DeserializableMembershipEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `MembershipEvent` object
  class DeserializableMembershipEvent < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceAction
    include DeserializableResourceCreationTimestamp

    has_one :member do |_rel, id, type|
      Hash[member_id: id, member_type: classify_type(type)]
    end
    
    has_one :organization do |_rel, id, type|
      Hash[organization_id: id, organization_type: classify_type(type)]
    end
  end
end
