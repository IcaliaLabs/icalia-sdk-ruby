# frozen_string_literal: true

module Icalia
  class Organization < ModelBase
    include ResourceTimestamps
    attr_reader :name

    has_many :email_accounts, :cloud_identities
  end
end
