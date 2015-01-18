# encoding: UTF-8

require 'rubygems'

require 'bundler/setup'
require 'bundler/gem_tasks'

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

if $0 == __FILE__
  Rake.application['usage'].invoke
end