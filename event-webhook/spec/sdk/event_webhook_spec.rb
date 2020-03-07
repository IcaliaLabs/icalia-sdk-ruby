RSpec.describe Icalia::SDK do
  it 'has an event webhook version number' do
    expect(Icalia::SDK::EVENT_WEBHOOK_VERSION).not_to be nil
  end
end
