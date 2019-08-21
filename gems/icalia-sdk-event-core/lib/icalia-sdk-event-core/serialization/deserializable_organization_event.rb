# frozen_string_literal: true

module Icalia::Event
  #= DeserializableOrganizationEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `OrganizationEvent` object
  class DeserializableOrganizationEvent < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceAction
    include DeserializableResourceCreationTimestamp

    has_one :organization do |_rel, id, type|
      Hash[organization_id: id, organization_type: classify_type(type)]
    end

    has_one :sender do |_rel, id, type|
      Hash[sender_id: id, sender_type: classify_type(type)]
    end
  end
end
