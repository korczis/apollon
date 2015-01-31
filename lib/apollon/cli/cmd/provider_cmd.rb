# encoding: utf-8

require 'gli'
require 'json'
require 'pp'
require 'terminal-table'

require_relative '../../client/client'
require_relative '../shared'

module Apollon
  # Apollon CLI
  module Cli
    desc 'Provider(s) manager'
    command :provider do |c|
      c.desc 'List existing providers'
      c.command :list do |cmd|
        cmd.action do
          # TODO: Replace with unified constructor
          client = Apollon::Client::Client.new
          puts JSON.pretty_generate(client.auth.providers.map(&:as_json))
        end
      end

      c.desc 'Show provider details'
      c.command :show do |cmd|
        cmd.action do |global_options, options, args|
          # TODO: Replace with unified constructor
          client = Apollon::Client::Client.new
          args = args.nil? || args.empty? ? client.auth.providers_names : args
          res = {}
          args.each do |provider_name|
            val = client.auth.providers.select { |provider| provider.name.downcase == provider_name.downcase }.first
            if val
              res[val.name] = val.as_json
            end
          end

          puts JSON.pretty_generate(res)
        end
      end
    end
  end
end