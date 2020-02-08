# frozen_string_literal: true

module Icalia::Event
  #= DeserializableEmailAccount
  #
  # Converts a JSONAPI.org serialization of a `EmailAccount` object from a
  # Notification topic into an `ActionController::Parameters` object that can be
  # used to create or update an email account
  class DeserializableEmailAccount < DeserializableResource
    attribute :address
    attribute(:'created-at') { |value| Hash[created_at: value] }

    has_one :owner do |_rel, id, type|
      Hash[owner_id: id, owner_type: classify_type(type)]
    end
  end
end
