RSpec.describe Icalia do
  it 'has a core version number' do
    expect(Icalia::SDK::CORE_VERSION).not_to be nil
  end

  it 'has an event webhook version number' do
    expect(Icalia::SDK::EVENT_WEBHOOK_VERSION).not_to be nil
  end

  it 'has an event notification version number' do
    expect(Icalia::SDK::EVENT_NOTIFICATION_VERSION).not_to be nil
  end
end
