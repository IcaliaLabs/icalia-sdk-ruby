# frozen_string_literal: true

module Icalia::Event
  module Shoryuken
    autoload :Worker, 'icalia-sdk-event-notification/shoryuken/worker'
    autoload :WorkerRegistry, 'icalia-sdk-event-notification/shoryuken/worker_registry'
    autoload :CLI, 'icalia-sdk-event-notification/shoryuken/cli'
  end
end
