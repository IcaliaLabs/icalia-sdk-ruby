RSpec.describe Icalia::Event do
  it 'has a version number' do
    expect(Icalia::Event::WEBHOOK_VERSION).not_to be nil
  end
end
