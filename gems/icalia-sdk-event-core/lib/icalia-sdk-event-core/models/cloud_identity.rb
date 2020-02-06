# frozen_string_literal: true

module Icalia
  class CloudIdentity < ModelBase
    attr_reader :provider,
                :id_at_provider,
                :created_at,
                :updated_at,
                :name,
                :identity_type
  end
end
