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
      res = client.auth.providers.map { |provider| provider['provider']}
      puts JSON.pretty_generate(res)
    end
  end

  c.desc 'Show provider details'
  c.command :show do |cmd|
    cmd.action do |global_options, options, args|
      res = args.map do |provider_name|
        client.auth.providers.select { |provider| provider['provider'].downcase == provider_name.downcase }.first
      end
      puts JSON.pretty_generate(res.compact)
    end
  end
end