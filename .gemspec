# encoding: utf-8

require 'rubygems'

$:.push File.expand_path("../lib", __FILE__)

require 'apollon/version.rb'

Gem::Specification.new do |s|
  s.name = 'apollon'
  s.version = Apollon::VERSION
  # s.platform = Gem::Platform::RUBY
  s.summary = 'Apollo Fat Box'
  s.description = 'CLI for Apollo Fat Box'
  s.authors = [
    'Tomas Korcak'
  ]
  s.email = 'korczis@gmail.com'

  s.homepage = 'https://github.com/korczis/apollon'
  s.license = 'MIT'
  s.require_paths = ['lib']

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_dependency 'aws-sdk-core', '~> 2.0.0.rc7'
  s.add_dependency 'digitalocean', '~> 1.1', '>= 1.1.0'
  s.add_dependency 'json_pure', '~> 1.8', '>= 1.8.1'
  s.add_dependency 'librarian-puppet', '~> 1.1', '>= 1.1.2'
  s.add_dependency 'multi_json', '~> 1.10', '>= 1.10.1'
  s.add_dependency 'puppet', '~> 3.6', '>= 3.6.2'
  s.add_dependency 'rake', '~> 10.3', '>= 10.3.2'

  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.0r'
  s.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  s.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.2'
end
