# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

include GLI::App

require_relative '../shared'

require_relative '../../client/client'

client = Apollon::Client.new

desc 'Machine(s) manager'
command :machine do |c|
  c.desc 'List existing machines'
  c.command :list do |cmd|
    cmd.action do
      client.cluster.machines.each do |machine|
        puts "#{machine.public_ip_address} - #{machine.private_ip_address} = #{machine.flavor.name}"
        # puts machine
      end
    end
  end
end