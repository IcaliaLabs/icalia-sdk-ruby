# frozen_string_literal: true

module Icalia
  class CodeRepository < ModelBase
    include ResourceIdentity
    
    attr_reader :owner # DeserializablePropertyResource   # has one owner

    attr_reader :created_at # include DeserializableResourceCreationTimestamp

    attr_reader :name, :private, :fork, :provider, :description, :url, :fork,
                :exists, :archived, :html_url, :full_name, :id_at_provider,
                :default_branch
  end
end
