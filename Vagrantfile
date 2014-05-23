# encoding: utf-8

require 'pp'
require 'multi_json'

require_relative 'lib/lib'

# Make sure that the box we need is locally available
BOX_PATH = File.join(File.dirname(__FILE__), 'artifacts', 'vagrant.box')
CORE_PACKER_FOLDER = File.join(File.dirname(__FILE__), 'packs', 'core', 'pack.sh')

if File.exists?(BOX_PATH) == false
  puts "Locally built vagrant.box does not exists. Creating ..."

  Dir.chdir(File.dirname(CORE_PACKER_FOLDER)) {
    system CORE_PACKER_FOLDER
  }

  puts "Done."
end

# Construct path to default apollo-fat-box profile
BASE_DIR = File.expand_path(File.dirname(__FILE__))

VAGRANT_DIR = File.join(BASE_DIR, 'vagrant')

PROFILES_DIR = File.join(VAGRANT_DIR, 'profiles')

DEFAULT_PROFILE_FILE = 'default.json'

DEFAULT_PROFILE_PATH = File.join(PROFILES_DIR, DEFAULT_PROFILE_FILE)

# Load default profile
nodes = MultiJson::load(File.new(DEFAULT_PROFILE_PATH))

# Iterate all configurations form loaded file
Vagrant.configure("2") do |config|
  nodes.each do |node_def|
    node_name = node_def['hostname'] || 'apollo-fat-node'

    config.vm.define node_name do |node|
      node.vm.box = node_def['box']
      node.vm.box_url = node_def['box_url']

      node.vm.boot_timeout = 300

      ports = node_def['network']['ports'] || []
      ports.each do |port|
        guest_port = port['guest']
        host_port = port['host']
        node.vm.network 'forwarded_port', guest: guest_port, host: host_port, auto_correct: true
      end

      # Specify and customize virtualization provider
      node.vm.provider 'virtualbox' do |provider|
        provider.customize ['modifyvm', :id, '--memory', 2048]
        provider.customize ['modifyvm', :id, '--cpuexecutioncap', '85']
      end

      # config.vm.provider :digital_ocean do |provider, override|
      #   override.ssh.private_key_path = '~/.ssh/id_rsa'
      #   override.vm.box = 'digital_ocean'
      #
      #   provider.client_id = ''
      #   provider.api_key = ''
      # end

      provisions = node_def['provisions'] || []
      provisions.each do |provision|
        if provision['name'] === 'puppet'
          node.vm.provision :puppet do |puppet|
            # Path to manifests folder
            val = provision['manifests_path']
            puppet.manifests_path = val if val

            # Name of manifest used
            val = provision['manifest_file']
            puppet.manifest_file = val if val

            # Folder where are puppet modules stored
            val = provision['module_path']
            puppet.module_path = val if val
          end
        end
      end
    end
  end
end
