# frozen_string_literal: true

module Icalia::Event
  #= DeserializablePerson
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `Person` object
  class DeserializablePerson < DeserializableResource
    include DeserializableResourceTimestamps

    attributes :name

    has_many(:'email-accounts') do |rel, _ids, _types|
      Hash[email_accounts: get_stand_ins(rel)]
    end

    has_many(:'cloud-identities') do |rel, _ids, _types|
      Hash[cloud_identities: get_stand_ins(rel)]
    end
  end
end
