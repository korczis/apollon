# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../../puppet/core'

desc 'Build new web-unit'
command :build do |c|
  c.action do # |global_options, options, args|
    # TODO: Implement here

    Apollon::Puppet
  end
end
