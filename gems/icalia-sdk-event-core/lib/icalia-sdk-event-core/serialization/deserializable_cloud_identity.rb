# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCloudIdentity
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `User` object
  class DeserializableCloudIdentity < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceTimestamps

    attributes :name, :provider

    attribute(:'identity-type') { |value| Hash[type: value] }
    attribute(:'id-at-provider') { |value| Hash[uid: value.to_s] }

    has_one :owner do |_rel, id, type|
      Hash[owner_id: id, owner_type: classify_type(type)]
    end
  end
end
