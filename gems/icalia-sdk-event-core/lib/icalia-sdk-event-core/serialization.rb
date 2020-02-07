# frozen_string_literal: true

require 'jsonapi/deserializable'

module Icalia
  module Event
    serialization_path = "icalia-sdk-event-core/serialization"

    autoload :Deserializer, "#{serialization_path}/deserializer"

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

    # Event deserialization

    autoload :DeserializableMembershipEvent,
             "#{serialization_path}/deserializable_membership_event"

    autoload :DeserializableOrganizationEvent,
             "#{serialization_path}/deserializable_organization_event"

    autoload :DeserializableOauthAccessTokenEvent,
             "#{serialization_path}/deserializable_oauth_access_token_event"

    # Deserializable Objects

    autoload :DeserializableMembership,
             "#{serialization_path}/deserializable_membership"

    autoload :DeserializableEmailAccount,
             "#{serialization_path}/deserializable_email_account"

    autoload :DeserializableUser,
             "#{serialization_path}/deserializable_user"

    autoload :DeserializablePerson,
             "#{serialization_path}/deserializable_person"

    autoload :DeserializableOauthAccessToken,
             "#{serialization_path}/deserializable_oauth_access_token"

    autoload :DeserializableOauthApplication,
             "#{serialization_path}/deserializable_oauth_application"

    autoload :DeserializableOrganization,
             "#{serialization_path}/deserializable_organization"

    autoload :DeserializableCodeRepositoryEvent,
             "#{serialization_path}/deserializable_code_repository_event"

    autoload :DeserializableCodeMergeRequest,
             "#{serialization_path}/deserializable_code_merge_request"

    autoload :DeserializableCodeMergeRequestEvent,
             "#{serialization_path}/deserializable_code_merge_request_event"

    autoload :DeserializableCodeCommit,
             "#{serialization_path}/deserializable_code_commit"

    autoload :DeserializableCodeRepository,
             "#{serialization_path}/deserializable_code_repository"

    autoload :DeserializableCodeRepositoryReference,
             "#{serialization_path}/deserializable_code_repository_reference"

    autoload :DeserializableCloudIdentity,
             "#{serialization_path}/deserializable_cloud_identity"
  end
end
