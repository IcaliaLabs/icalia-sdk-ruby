# frozen_string_literal: true

module Icalia
  module Event
    serialization_path = 'icalia-sdk-event-core/serialization'
  
    # Deserialization Modules:
    autoload :DeserializableResourceIdentity,
            "#{serialization_path}/deserializable_resource_identity"

    autoload :DeserializableResourceAction,
    "#{serialization_path}/deserializable_resource_action"

    autoload :DeserializableResourceCreationTimestamp,
            "#{serialization_path}/deserializable_resource_creation_timestamp"

    autoload :DeserializableResourceTimestamps,
            "#{serialization_path}/deserializable_resource_timestamps"

    autoload :DeserializablePropertyResource,
             "#{serialization_path}/deserializable_property_resource"

    # Deserializable Events

    autoload :DeserializableMembershipEvent,
             "#{serialization_path}/deserializable_membership_event"

    autoload :DeserializableOrganizationEvent,
             "#{serialization_path}/deserializable_organization_event"

    autoload :DeserializableOAuthAccessTokenEvent,
             "#{serialization_path}/deserializable_oauth_access_token_event"

    # Deserializable Objects

    autoload :DeserializableUser,
            "#{serialization_path}/deserializable_user"

    autoload :DeserializableOrganization,
              "#{serialization_path}/deserializable_organization"

    autoload :DeserializableCodeRepositoryEvent,
            "#{serialization_path}/deserializable_code_repository_event"

    autoload :DeserializableCodeRepository,
             "#{serialization_path}/deserializable_code_repository"

    autoload :DeserializableCloudIdentity,
             "#{serialization_path}/deserializable_cloud_identity"
  end
end
