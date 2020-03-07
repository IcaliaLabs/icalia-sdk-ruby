require_relative 'of_an_event'

RSpec.shared_examples 'an action event' do
  it_behaves_like 'an event'

  describe '#actor' do
    it 'is a person' do
      expect(subject).to have_attributes actor: a_kind_of(Icalia::Person)
    end
  end

  describe '#action' do
    it 'is a string' do
      expect(subject).to have_attributes action: an_instance_of(String)
    end
  end
end
