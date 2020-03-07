require 'active_support/json'
require_relative 'shared_examples/of_an_action_event'

RSpec.describe Icalia::CodeRepositoryEvent do
  subject do
    example_json = fixture_file('code-repository-event.json').read
    example_data = ActiveSupport::JSON.decode example_json
    Icalia::Deserializer.new(example_data).perform
  end

  it_behaves_like 'an action event'

  describe '#repository' do
    it 'is a code repository' do
      expect(subject).to have_attributes repository: a_kind_of(Icalia::CodeRepository)
    end
  end

  def fixture_file(filename)
    filepath = Pathname.new('.').join('spec', 'fixtures', 'files', filename)
    File.open filepath
  end
end
