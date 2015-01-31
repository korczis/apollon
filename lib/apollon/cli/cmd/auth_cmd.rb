# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

require_relative '../../client/client'

require_relative '../shared'

module Apollon
  # Apollon CLI
  module Cli
    desc 'Authentication'
    command :auth do |c|
      c.desc 'Initialize authentication credentials'
      c.command :init do |cmd|
        cmd.action do |global_options, options, args|
          client = Apollon::Client::Client.new
          res = client.auth.init
          puts JSON.pretty_generate(res)
        end
      end

      c.desc 'Show authentication credentials'
      c.command :show do |cmd|
        cmd.action do |global_options, options, args|
          client = Apollon::Client::Client.new
          args = args.nil? || args.empty? ? client.auth.providers_names : args
          res = {}
          args.each do |provider_name|
            val = client.auth.config.select { |k, v| k.downcase == provider_name.downcase }
            res.merge!(val) if val
          end

          puts JSON.pretty_generate(res)
        end
      end
    end
  end
end