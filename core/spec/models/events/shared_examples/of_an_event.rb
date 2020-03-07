RSpec.shared_examples 'an event' do
  describe '#timestamp' do
    it 'is an instance of Time' do
      expect(subject).to have_attributes timestamp: an_instance_of(Time)
    end
  end
end
