# frozen_string_literal: true

module Icalia::Event
  #= DeserializablePerson
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `Person` object
  class DeserializablePerson < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceTimestamps

    attributes :name

    has_many(:'email-accounts') do |_rel, ids, types|
      Hash[
        email_account_ids: ids,
        email_account_types: types.map { |type| classify_type(type) }
      ]
    end

    has_many(:'cloud-identities') do |_rel, ids, types|
      Hash[
        cloud_identity_ids: ids,
        cloud_identity_types: types.map { |type| classify_type(type) }
      ]
    end
  end
end
