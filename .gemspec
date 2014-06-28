# encoding: utf-8

require 'rubygems'

$:.push File.expand_path('lib', __FILE__)

require_relative 'lib/version.rb'

Gem::Specification.new do |s|
  s.name = 'apollon'
  s.version = Apollon::VERSION
  s.date = '2014-05-23'
  s.summary = 'Apollo Fat Box'
  s.description = 'CLI for Apollo Fat Box'
  s.authors = [
    'Tomas Korcak'
  ]
  s.email = 'korczis@gmail.com'
  s.files = [
    'lib/lib.rb'
  ]
  s.homepage = 'https://github.com/korczis/apollo-fat-box'
  s.license = 'MIT'

  s.require_paths = ['lib']

  s.executables << 'apollon'

  s.add_dependency 'aws-sdk-core', '~> 2.0.0.rc7'
  s.add_dependency 'digitalocean', '~> 1.1.0'
  s.add_dependency 'json_pure', '~> 1.8.1'
  s.add_dependency 'librarian-puppet', '~> 1.1.2'
  s.add_dependency 'multi_json', '~> 1.10.1'
  s.add_dependency 'prettyprint', '~> 0.0.1'
  s.add_dependency 'puppet', '~> 3.6.2'
  s.add_dependency 'rake', '~> 10.3.2'
end
