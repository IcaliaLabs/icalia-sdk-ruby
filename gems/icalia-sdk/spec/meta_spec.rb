RSpec.describe Icalia do
  it 'has a version number' do
    expect(Icalia::VERSION).not_to be nil
  end

  it 'includes the Event library' do
    expect { Icalia::Event }.not_to raise_error
  end
end
