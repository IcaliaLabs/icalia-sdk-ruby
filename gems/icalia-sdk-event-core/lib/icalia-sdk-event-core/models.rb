# frozen_string_literal: true

module Icalia
  models_path = 'icalia-sdk-event-core/models'
  
  autoload :ModelBase, "#{models_path}/model_base"
  autoload :ModelProxy, "#{models_path}/model_proxy"
  autoload :ModelCollectionProxy, "#{models_path}/model_collection_proxy"

  autoload :ResourceIdentity, "#{models_path}/resource_identity"
  autoload :ResourceAction, "#{models_path}/resource_action"
  autoload :ResourceTimestamps, "#{models_path}/resource_timestamps"

  # Core Models:
  autoload :Person, "#{models_path}/person"
  autoload :Organization, "#{models_path}/organization"

  autoload :EmailAccount, "#{models_path}/email_account"
  autoload :CloudIdentity, "#{models_path}/cloud_identity"

  autoload :Membership, "#{models_path}/membership"

  autoload :CodeCommit, "#{models_path}/code_commit"
  autoload :CodeRepository, "#{models_path}/code_repository"
  autoload :CodeRepositoryReference, "#{models_path}/code_repository_reference"

  autoload :CodeMergeRequest, "#{models_path}/code_merge_request"

  # Event Models:
  event_models_path = "#{models_path}/events"
  autoload :MembershipEvent, "#{event_models_path}/membership_event"
  autoload :OrganizationEvent, "#{event_models_path}/organization_event"
  autoload :CodeMergeRequestEvent, "#{event_models_path}/code_merge_request_event"
end
