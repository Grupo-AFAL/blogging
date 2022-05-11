# frozen_string_literal: true

require_relative 'lib/blogging/version'

Gem::Specification.new do |spec|
  spec.name        = 'blogging'
  spec.version     = Blogging::VERSION
  spec.authors     = ['Miguel Frias']
  spec.email       = ['migue_tj_frias@hotmail.com']
  spec.homepage    = 'https://github.com/Grupo-AFAL/blogging'
  spec.summary     = 'Rails engine for blogging'
  spec.description = 'Rails engine for blogging'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'friendly_id', '~> 5.4.0'
  spec.add_dependency 'friendly_id-mobility', '~> 1.0.3'
  spec.add_dependency 'mobility', '~> 1.2.6'
  spec.add_dependency 'mobility-actiontext'
  spec.add_dependency 'rails', '>= 7.0.2.3'
  spec.add_dependency 'turbo-rails', '>= 1.0.1'
end
