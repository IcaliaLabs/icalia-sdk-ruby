# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCloudIdentity
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `User` object
  class DeserializableCloudIdentity < JSONAPI::Deserializable::Resource
    include DeserializableResourceTimestamps

    attributes :name, :provider

    attribute(:'identity-type') { |value| Hash[type: value] }
    attribute(:'id-at-provider') { |value| Hash[uid: value.to_s] }

    has_one :'directory-entry' do |_rel, id, type|
      next Hash[] if type.blank?

      Hash["#{type}_id".to_sym => id]
    end
  end
end
