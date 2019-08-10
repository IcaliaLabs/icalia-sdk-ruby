module Icalia::Event
  #= DeserializableCodeCheckRunEvent
  #
  # This class is responsible for converting a JSONAPI.org representation
  # of an Icalia Event's `CodeCheckRunEvent` object
  class DeserializableCodeCheckRunEvent < JSONAPI::Deserializable::Resource
    include DeserializableResourceIdentity
    include DeserializableResourceAction
    include DeserializableResourceCreationTimestamp
    
    id { |value| Hash[unique_id: value] }

    has_one :'check-run' do |_rel, id, type|
      Hash[check_run: id]
    end

    has_one :'check-suite' do |_rel, id, _type|
      Hash[check_suite_id: CheckSuite.where(unique_id: id).pluck(:id).last]
    end
  end
end
