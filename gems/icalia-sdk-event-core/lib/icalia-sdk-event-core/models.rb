# frozen_string_literal: true

module Icalia
  models_path = 'icalia-sdk-event-core/models'
  
  autoload :ModelBase, "#{models_path}/model_base"
  autoload :ModelProxy, "#{models_path}/model_proxy"


  autoload :ResourceIdentity, "#{models_path}/resource_identity"
  autoload :ResourceAction, "#{models_path}/resource_action"
  autoload :ResourceTimestamps, "#{models_path}/resource_timestamps"

  # Core Models:
  autoload :Person, "#{models_path}/person"

  autoload :CodeCommit, "#{models_path}/code_commit"
  autoload :CodeRepository, "#{models_path}/code_repository"
  autoload :CodeCommitReference, "#{models_path}/code_commit_reference"

  autoload :CodeMergeRequest, "#{models_path}/code_merge_request"

  # Event Models:
  autoload :CodeMergeRequestEvent, "#{models_path}/code_merge_request_event"
end
