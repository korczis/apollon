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

      res.compact!

      puts JSON.pretty_generate(res)
    end
  end

  c.desc 'Show provider details'
  c.command :show do |cmd|
    cmd.action do |global_options, options, args|
      args = args.nil? || args.empty? ? client.auth.providers_names : args
      res = {}
      args.each do |provider_name|
        val = client.auth.config.select { |k,v| k.downcase == provider_name.downcase }
        res.merge!(val) if val
      end

      puts JSON.pretty_generate(res)
    end
  end
end