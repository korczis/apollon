# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../shared'

desc 'Deploy built web-unit'
command :deploy do |c|
  c.action do # |global_options, options, args|
    # TODO: Implement here
  end
end
