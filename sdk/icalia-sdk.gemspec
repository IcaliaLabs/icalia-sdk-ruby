
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icalia-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'icalia-sdk'
  spec.version       = Icalia::SDK::META_VERSION
  spec.authors       = ['Roberto Quintanilla']
  spec.email         = %w[vov@icalialabs.com]

  spec.summary       = 'Icalia SDK for Ruby - Events Core Library'
  spec.description   = 'Official Icalia SDK for Icalia Events Core' \
                       'This gem is part of the Icalia SDK for Ruby.'
  spec.homepage      = 'https://github.com/IcaliaLabs/icalia-sdk-ruby'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
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
  spec.files = Dir
    .glob("{lib,exe}/**/*", File::FNM_DOTMATCH)
    .reject {|f| File.directory?(f) }

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency 'icalia-sdk-event', Icalia::SDK::META_VERSION

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
