# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../../cleanup/cleanup'

require_relative '../shared'

desc 'Cleanup Apollon Environemnt'
command :cleanup do |c|
  c.action do |_global_options, _options, _args|
    Apollon::Cleanup.cleanup
  end
end
