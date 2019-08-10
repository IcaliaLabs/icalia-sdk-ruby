
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icalia-sdk-event-notification/version'

Gem::Specification.new do |spec|
  spec.name        = 'icalia-sdk-event-notification'
  spec.version     = Icalia::Event::NOTIFICATION_VERSION
  spec.authors     = ['Roberto Quintanilla']
  spec.email       = %w[vov@icalialabs.com]

  spec.summary     = 'Icalia SDK Events for Ruby - via AWS Simple Notification'\
                     ' Service'
  spec.description = 'Official Ruby gem for Icalia Events via AWS Simple '\
                     'Notification Service. This gem is part of the Icalia SDK'\
                     ' for Ruby.'
  spec.homepage    = 'https://github.com/IcaliaLabs/icalia-sdk-ruby'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/IcaliaLabs/icalia-sdk-ruby'
    spec.metadata['changelog_uri'] = 'https://github.com/IcaliaLabs/icalia-sdk-ruby'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency 'icalia-sdk-event-core',
                      Icalia::Event::NOTIFICATION_VERSION

  # We require mattr_reader to be able to accept a `default` value, which is
  # only supported on Rails ActiveSupport >= 5.2.0:
  spec.add_dependency 'activesupport', '~> 5.2', '>= 5.2.0'

  spec.add_dependency 'aws-sdk-sqs', '~> 1.20'
  spec.add_dependency 'aws-sdk-sns', '~> 1.19'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
