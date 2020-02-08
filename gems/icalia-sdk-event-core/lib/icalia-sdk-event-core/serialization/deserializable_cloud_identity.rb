# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCloudIdentity
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `User` object
  class DeserializableCloudIdentity < DeserializableResource
    include DeserializableResourceTimestamps

    attributes :name, :provider

    attribute(:'identity-type') { |value| Hash[identity_type: value] }
    attribute(:'id-at-provider') { |value| Hash[id_at_provider: value.to_s] }

    has_one :owner do |_rel, id, type|
      Hash[owner: get_stand_in(id: id, type: classify_type(type))]
    end
  end
end
