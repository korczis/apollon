# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

require_relative '../../client/client'
require_relative '../shared'

client = Apollon::Client.new

module Apollon
  # Apollon CLI
  module Cli

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
  end
end
