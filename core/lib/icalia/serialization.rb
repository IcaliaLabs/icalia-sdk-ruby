# frozen_string_literal: true

require 'jsonapi/deserializable'

module Icalia
  autoload :Deserializer, 'icalia/serialization/deserializer'

  # Deserialization Modules:
  autoload :DeserializableResourceAction,
           'icalia/serialization/deserializable_resource_action'

  autoload :DeserializableResourceCreationTimestamp,
           'icalia/serialization/deserializable_resource_creation_timestamp'

  autoload :DeserializableResourceTimestamps,
           'icalia/serialization/deserializable_resource_timestamps'

  autoload :DeserializablePropertyResource,
           'icalia/serialization/deserializable_property_resource'

  # Event deserialization
  autoload :DeserializableMembershipEvent,
           'icalia/serialization/deserializable_membership_event'

  autoload :DeserializableOrganizationEvent,
           'icalia/serialization/deserializable_organization_event'

  autoload :DeserializableAuthorizationEvent,
           'icalia/serialization/deserializable_authorization_event'

  autoload :DeserializableCodeMergeRequestEvent,
           'icalia/serialization/deserializable_code_merge_request_event'

  # Deserializable Objects
  autoload :DeserializableResource,
           'icalia/serialization/deserializable_resource'

  autoload :DeserializableEmailAccount,
           'icalia/serialization/deserializable_email_account'

  autoload :DeserializableUser,
           'icalia/serialization/deserializable_user'
  
  autoload :DeserializableMembership,
           'icalia/serialization/deserializable_membership'

  autoload :DeserializablePerson,
           'icalia/serialization/deserializable_person'

  autoload :DeserializableOAuthAccessToken,
           'icalia/serialization/deserializable_oauth_access_token'

  autoload :DeserializableOauthApplication,
           'icalia/serialization/deserializable_oauth_application'

  autoload :DeserializableOrganization,
           'icalia/serialization/deserializable_organization'

  autoload :DeserializableCodeRepositoryEvent,
           'icalia/serialization/deserializable_code_repository_event'

  autoload :DeserializableCodeMergeRequest,
           'icalia/serialization/deserializable_code_merge_request'

  autoload :DeserializableCodeCommit,
           'icalia/serialization/deserializable_code_commit'

  autoload :DeserializableCodeRepository,
           'icalia/serialization/deserializable_code_repository'

  autoload :DeserializableCodeRepositoryReference,
           'icalia/serialization/deserializable_code_repository_reference'

  autoload :DeserializableCloudIdentity,
           'icalia/serialization/deserializable_cloud_identity'
end
