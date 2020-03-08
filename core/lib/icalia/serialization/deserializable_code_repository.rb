# frozen_string_literal: true

module Icalia
  #= DeserializableCodeRepository
  #
  # This class is responsible for converting a JSONAPI.org representation of an
  # Icalia Event's `CodeRepository` object
  class DeserializableCodeRepository < DeserializableResource
    include DeserializablePropertyResource   # has one owner
    include DeserializableResourceTimestamps

    attributes :name, :private, :fork, :provider, :description, :url, :fork,
               :exists, :archived

    attribute(:'html-url') { |value| Hash[html_url: value]}
    attribute(:'full-name') { |value| Hash[full_name: value] }
    
    attribute(:'id-at-provider') { |value| Hash[id_at_provider: value] }
    attribute(:'default-branch') { |value| Hash[default_branch: value] }

    has_one :owner do |_rel, id, type|
      stand_in = Icalia::ModelProxy.new id: id, type: classify_type(type)
      Hash[owner: stand_in]
    end
  end
end
