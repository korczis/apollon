# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

include GLI::App

require_relative '../shared'

require_relative '../../client/client'

client = Apollon::Client.new

desc 'High Level Cluster management'
command :cluster do |c|
  c.desc 'Show information about cluster'
  c.command :show do |cmd|
    cmd.action do
      client.cluster.machines.each do |machine|
        pp machine.raw
      end
    end
  end
end