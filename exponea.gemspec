require_relative 'lib/exponea/version'

Gem::Specification.new do |spec|
  spec.name = 'exponea'
  spec.version = Exponea::VERSION
  spec.authors = ['Lubomir Vnenk']
  spec.email = ['lubomir.vnenk@zoho.com']

  spec.summary = 'Gem to integrate exponea into your app'
  spec.description = 'Gem to integrate exponea into your app. Provides api for adding events and users, also bulk actions'
  spec.homepage = 'https://github.com/lubosch/exponea'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/lubosch/exponea.git'
  spec.metadata['changelog_uri'] = 'https://raw.githubusercontent.com/lubosch/exponea/master/changelog.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 1'
  spec.add_dependency 'faraday_middleware', '~> 1'

  spec.add_development_dependency 'codecov', '~> 0.1.10'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.93.0'
  spec.add_development_dependency 'simplecov', '~> 0.18.5'
  spec.add_development_dependency 'webmock', '~> 3.9.0'
end
