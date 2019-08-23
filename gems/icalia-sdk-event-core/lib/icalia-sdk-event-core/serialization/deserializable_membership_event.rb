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

    has_one :membership do |_rel, id, type|
      Hash[membership_id: id, membership_type: classify_type(type)]
    end
    
    has_one :sender do |_rel, id, type|
      Hash[sender_id: id, sender_type: classify_type(type)]
    end
  end
end
