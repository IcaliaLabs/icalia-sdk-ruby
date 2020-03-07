# frozen_string_literal: true

module Icalia
  autoload :ModelBase, 'icalia/models/model_base'
  autoload :ModelProxy, 'icalia/models/model_proxy'
  autoload :ModelCollectionProxy, 'icalia/models/model_collection_proxy'

  autoload :ResourceAction, 'icalia/models/resource_action'
  autoload :ResourceIdentity, 'icalia/models/resource_identity'
  autoload :ResourceTimestamps, 'icalia/models/resource_timestamps'

  # Core Models:
  autoload :Person, 'icalia/models/person'
  autoload :Organization, 'icalia/models/organization'

  autoload :EmailAccount, 'icalia/models/email_account'
  autoload :CloudIdentity, 'icalia/models/cloud_identity'

  autoload :Membership, 'icalia/models/membership'

  autoload :CodeCommit, 'icalia/models/code_commit'
  autoload :CodeRepository, 'icalia/models/code_repository'
  autoload :CodeRepositoryReference, 'icalia/models/code_repository_reference'

  autoload :CodeMergeRequest, 'icalia/models/code_merge_request'
  autoload :OAuthAccessToken, 'icalia/models/oauth_access_token'

  # Event Models:
  autoload :MembershipEvent, 'icalia/models/events/membership_event'
  autoload :OrganizationEvent, 'icalia/models/events/organization_event'
  autoload :AuthorizationEvent, 'icalia/models/events/authorization_event'
  autoload :CodeRepositoryEvent, 'icalia/models/events/code_repository_event'
  autoload :CodeMergeRequestEvent, 'icalia/models/events/code_merge_request_event'
end
