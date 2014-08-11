# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../shared'

desc 'Bootstrap Apollon Environemnt'
command :bootstrap do |c|
  c.action do |_global_options, _options, _args|
    # TODO: Implement
    puts 'Bootstraping Apollon Environment'
  end
end
