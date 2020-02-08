# frozen_string_literal: true

module Icalia::Event
  #= DeserializableMembershipEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `MembershipEvent` object
  class DeserializableMembershipEvent < DeserializableResource
    include DeserializableResourceAction
    include DeserializableResourceCreationTimestamp

    has_one :membership do |_rel, id, type|
      Hash[membership: get_stand_in(id: id, type: classify_type(type))]
    end
  end
end
