# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

include GLI::App

require_relative '../shared'

require_relative '../../client/client'

client = Apollon::Client.new

desc 'Authentication'
command :auth do |c|
  c.desc 'Initialize authentication credentials'
  c.command :init do |cmd|
    cmd.action do
      client.auth.init
    end
  end

  c.desc 'Show authentication credentials'
  c.command :show do |cmd|
    cmd.action do
      client.auth.show
    end
  end
end