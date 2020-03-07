# frozen_string_literal: true

module Icalia
  class CodeRepositoryEvent < ModelBase
    include ResourceAction
    attr_reader :repository

    %i[created deleted archived unarchived edited renamed transferred publicized
    privatized].each do |action_name|
      define_method "#{action_name}?".to_sym do
        action == action_name
      end
    end
  end
end
