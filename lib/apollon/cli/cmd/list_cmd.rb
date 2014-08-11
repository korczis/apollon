# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../shared'

desc 'List deployed web-units'
command :list do |c|
  c.action do # |global_options, options, args|
    # TODO: Implement here
  end
end
