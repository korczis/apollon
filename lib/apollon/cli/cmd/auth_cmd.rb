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
    cmd.action do |global_options, options, args|
      res = client.auth.init
      puts JSON.pretty_generate(res)
    end
  end

  c.desc 'Show authentication credentials'
  c.command :show do |cmd|
    cmd.action do |global_options, options, args|
      args = args.nil? || args.empty? ? client.auth.providers_names : args
      res = {}
      args.each do |provider_name|
        val = client.auth.show.select { |k, v| k.downcase == provider_name.downcase }
        res.merge!(val) if val
      end

      puts JSON.pretty_generate(res)
    end
  end
end