# frozen_string_literal: true

module Icalia
  class CodeRepository < ModelBase
    include ResourceIdentity
    
    has_one :owner # DeserializablePropertyResource   # has one owner

    attr_reader :created_at, :updated_at

    attr_reader :name, :private, :fork, :provider, :description, :url, :fork,
                :exists, :archived, :html_url, :full_name, :id_at_provider,
                :default_branch
  end
end
