# encoding: utf-8

require 'gli'
require 'json'
require 'pp'
require 'terminal-table'

include GLI::App

require_relative '../shared'

require_relative '../../client/client'

client = Apollon::Client.new

desc 'Provider(s) manager'
command :provider do |c|
  c.desc 'List existing providers'
  c.command :list do |cmd|
    cmd.action do
      res = client.auth.providers
      puts JSON.pretty_generate(res)
    end
  end
end