# encoding: utf-8

require 'awesome_print'
require 'gli'
require 'multi_json'
require 'terminal-table'

require_relative '../../client/client'
require_relative '../shared'

module Apollon
  # Apollon CLI
  module Cli
    desc 'High Level SSH Keys management'
    command :keys do |c|
      c.desc 'Show keys'
      c.command :show do |cmd|
        cmd.action do |_, _, args|
          # TODO: Replace with unified constructor
          client = Apollon::Client::Client.new
          providers = client.providers(args)

          res = providers.pmap do |provider|
            keys = provider.ssh_keys
            keys
          end

          res = res.flatten.map(&:attributes)

          # ap res
          # puts MultiJson.dump(res, :pretty => true)
          puts JSON.pretty_generate(res)
        end
      end
    end
  end
end
