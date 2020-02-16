# frozen_string_literal: true

module Icalia
  class Person < ModelBase
    include ResourceTimestamps
    attr_reader :full_name, :given_name, :family_name,
                :gender_type, :custom_gender,
                :date_of_birth

    alias name full_name

    has_many :email_accounts, :cloud_identities
  end
end
