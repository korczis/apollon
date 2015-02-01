# encoding: utf-8

require 'gli'
require 'highline/import'
require 'json'
require 'pp'
require 'sshkey'
require 'terminal-table'

require_relative '../../client/client'
require_relative '../shared'

module Apollon
  # Apollon CLI
  module Cli
    desc 'High Level Machines manager'
    command :machines do |c|
      c.desc 'List existing machines'
      c.command :list do |cmd|
        cmd.action do |_, _, args|
          # TODO: Replace with unified constructor
          client = Apollon::Client::Client.new
          providers = client.providers(args)

          res = providers.map do |provider|
            provider.machines.as_json
          end

          puts JSON.pretty_generate(res)
        end
      end

      c.desc 'Create new machine'
      c.command :create do |cmd|
        cmd.action do |_, _, args|
          client = Apollon::Client::Client.new
          provider = client.auth.provider(args.first)

          keys = provider.compute.ssh_keys
          images = provider.barge.image.all.to_a[0][1].map { |i| i['slug'] }.compact
          sizes = provider.barge.size.all.to_a[0][1].map { |i| i['slug'] }.compact
          regions = provider.barge.region.all.to_a[0][1].map { |i| i['slug'] }.compact

          user_data_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'config/coreos/node-simple.yml'))
          user_data = File.read(user_data_path)
          opts = {
            name: '',
            image: '',
            size: '',
            region: '',
            user_data: user_data,
            private_networking: true,
            ipv6: true,
            ssh_keys: [keys.first.id]
          }

          # The new and improved choose()...
          say("\nCreating new machine...")

          opts[:name] = ask('Name?')
          choose do |menu|
            menu.prompt = 'Which image?'
            menu.choices(*images) do |val|
              opts[:image] = val
            end
          end

          choose do |menu|
            menu.prompt = 'Which size? '
            menu.choices(*sizes) do |val|
              opts[:size] = val
            end
          end

          choose do |menu|
            menu.prompt = 'Which region?'
            menu.choices(*regions) do |val|
              opts[:region] = val
            end
          end

          puts JSON.pretty_generate(opts)

          server = provider.create_machine(opts)
          puts JSON.pretty_generate(server)
        end
      end
    end
  end
end
