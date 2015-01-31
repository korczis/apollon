# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

require_relative '../../client/client'
require_relative '../shared'

module Apollon
  # Apollon CLI
  module Cli

    desc 'High Level Cluster management'
    command :cluster do |c|
      c.desc 'Show information about cluster'
      c.command :show do |cmd|
        cmd.action do
          # TODO: Replace with unified constructor
          client = Apollon::Client::Client.new
          puts JSON.pretty_generate(client.cluster.machines.map(&:as_json))
        end
      end
    end
  end
end
