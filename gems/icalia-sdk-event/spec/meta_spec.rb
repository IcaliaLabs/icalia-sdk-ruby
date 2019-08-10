RSpec.describe Icalia::Event do
  it 'has a version number' do
    expect(Icalia::Event::VERSION).not_to be nil
  end
  
  it 'has a core version number' do
    expect(Icalia::Event::CORE_VERSION).not_to be nil
  end
  
  it 'has a notification version number' do
    expect(Icalia::Event::NOTIFICATION_VERSION).not_to be nil
  end
  
  it 'has a webhook version number' do
    expect(Icalia::Event::WEBHOOK_VERSION).not_to be nil
  end
end
