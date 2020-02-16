# frozen_string_literal: true

module Icalia::Event
  #= DeserializablePerson
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `Person` object
  class DeserializablePerson < DeserializableResource
    include DeserializableResourceTimestamps

    attribute(:'full-name') { |value| Hash[full_name: value] }
    attribute(:'given-name') { |value| Hash[given_name: value] }
    attribute(:'family-name') { |value| Hash[family_name: value] }
    attribute(:'gender-type') { |value| Hash[gender_type: value] }
    attribute(:'custom-gender') { |value| Hash[custom_gender: value] }
    attribute(:'date-of-birth') { |value| Hash[date_of_birth: value] }

    has_many(:'email-accounts') do |rel, _ids, _types|
      Hash[email_accounts: get_stand_ins(rel)]
    end

    has_many(:'cloud-identities') do |rel, _ids, _types|
      Hash[cloud_identities: get_stand_ins(rel)]
    end
  end
end
