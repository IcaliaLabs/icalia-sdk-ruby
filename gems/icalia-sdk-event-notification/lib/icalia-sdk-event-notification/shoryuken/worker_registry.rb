# frozen_string_literal: true

module Icalia::Event::Shoryuken
  class WorkerRegistry < Shoryuken::DefaultWorkerRegistry
    def fetch_worker(queue, message)
      worker = super
      return worker if worker.present?
  
      require_jobs if empty_mappings?
  
      topic_name = extract_topic_name(message)
  
      worker_class = Icalia::Event::TopicMessageProcessing
        .worker_mappings[topic_name]
      
      return worker_class.new if worker_class.present?
    end
  
    protected
  
    delegate :extract_topic_name, :require_jobs, to: :class
    delegate :empty_mappings?, to: Icalia::Event::TopicMessageProcessing
  
    def self.require_jobs
      path = Rails.root.join('app', 'jobs', '**', '*_job.rb')
      Dir[path].each {|file| require file }
    end
  
    def self.extract_topic_name(message)
      extract_metadata(message)['topic_arn'].split(':')[5..-1].join(':')
    end
  
    def self.extract_metadata(message)
      extract_body(message)
        .except('Message')
        .transform_keys(&:underscore)
        .with_indifferent_access
    end
  
    def self.extract_body(message)
      ActiveSupport::JSON.decode message.body
    end
  end
end
