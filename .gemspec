# encoding: utf-8

require 'rubygems'

$:.push File.expand_path("../lib", __FILE__)

require 'apollon/version.rb'

Gem::Specification.new do |s|
  s.name = 'apollon'
  s.version = Apollon::VERSION
  # s.platform = Gem::Platform::RUBY
  s.summary = 'Your own personal cluster built on top of the cloud.'
  s.description = 'Your own personal cluster built on top of the cloud.'
  s.authors = [
    'Tomas Korcak'
  ]
  s.email = 'korczis@gmail.com'

  s.homepage = 'https://github.com/korczis/apollon'
  s.license = 'MIT'
  s.require_paths = ['lib']

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_dependency 'aws-sdk-core', '~> 2.0', '>= 2.0.19'
  s.add_dependency 'digitalocean', '~> 1.2', '>= 1.2.0'
  s.add_dependency 'fog', '~> 1.27', '>= 1.27.0'
  s.add_dependency 'fleet-api', '~> 0.9', '>= 0.9.0'
  s.add_dependency 'gli', '~> 2.12', '>= 2.12.0'
  s.add_dependency 'json_pure', '~> 1.8', '>= 1.8.0'
  s.add_dependency 'multi_json', '~> 1.10', '>= 1.10.0'
  s.add_dependency 'rake', '~> 10.4', '>= 10.4.0'
  s.add_dependency 'terminal-table', '~> 1.4', '>= 1.4.5'

  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.2'
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
  s.add_development_dependency 'rubocop', '~> 0.28', '>= 0.28.0'
  s.add_development_dependency 'simplecov', '~> 0.9', '>= 0.9.1'
end