# frozen_string_literal: true

module Icalia::Event::Shoryuken
  module CLI
    autoload :Base,   'icalia-sdk-event-notification/shoryuken/cli/base'
    autoload :Runner, 'icalia-sdk-event-notification/shoryuken/cli/runner'
    autoload :SQS,    'icalia-sdk-event-notification/shoryuken/cli/sqs'
  end
end
