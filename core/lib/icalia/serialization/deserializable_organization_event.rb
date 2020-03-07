# frozen_string_literal: true

module Icalia
  #= DeserializableOrganizationEvent
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `OrganizationEvent` object
  class DeserializableOrganizationEvent < DeserializableResource
    include DeserializableResourceAction
    include DeserializableResourceCreationTimestamp

    has_one :organization do |_rel, id, type|
      Hash[organization: get_stand_in(id: id, type: classify_type(type))]
    end
  end
end
