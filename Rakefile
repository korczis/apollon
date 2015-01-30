# encoding: UTF-8

require 'rubygems'

require 'bundler/setup'
require 'bundler/gem_tasks'

require 'coveralls/rake/task'

require 'rake/testtask'
require 'rake/notes/rake_task'
require 'rspec/core/rake_task'

require 'yard'

Coveralls::RakeTask.new

RSpec::Core::RakeTask.new(:test)

desc 'Run Rubocop'
task :cop do
  exec 'rubocop lib/'
end

task :usage do
  puts 'No rake task specified, use rake -T to list them'
  # puts "No rake task specified so listing them ..."
  # Rake.application['tasklist'].invoke
end
task :default => [:usage]

desc 'Run continuous integration test'
task :ci do
  Rake::Task['test'].invoke
  # Rake::Task['test:cop'].invoke if RUBY_VERSION.start_with?('2.2') == false
  Rake::Task['coveralls:push'].invoke
end

YARD::Rake::YardocTask.new

if $0 == __FILE__
  Rake.application['usage'].invoke
end