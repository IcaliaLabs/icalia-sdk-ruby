# frozen_string_literal: true

module Icalia::Event
  #= DeserializableCodeIssue
  #
  # Converts a JSONAPI.org serialization of a `CodeIssue` object from a
  # Notification topic into an `ActionController::Parameters` object that can be
  # used to create or update code issue data
  class DeserializableCodeIssue < DeserializableResource
    LOCATION_DATA_KEYS = %w[path start-line end-line]

    def self.deserialize_location_data(location_data)
      location_data
        .slice(*LOCATION_DATA_KEYS)
        .transform_keys { |key| key.underscore.to_sym }
    end

    attribute(:path) { |value| Hash[filename: value] }

    attribute :location do |value|
      Hash[location: deserialize_location_data(value)]
    end

    attribute :'other-locations' do |value|
      other_locations_data = (value || [])
        .map { |data| deserialize_location_data data }

      Hash[other_locations: other_locations_data]
    end

    attribute(:content) { |value| Hash[content: value] }
    attribute(:description) { |value| Hash[message: value] }

    attribute(:'check-name') { |value| Hash[check_name: value] }
    attribute(:'engine-name') { |value| Hash[engine_name: value] }
  end
end
