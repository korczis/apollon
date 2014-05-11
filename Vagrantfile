# encoding: utf-8

require 'pp'
require 'multi_json'

domain = 'local-domain.net'

# Construct path to default apollo-fat-box profile
BASE_DIR = File.expand_path(File.dirname(__FILE__))
VAGRANT_DIR = File.join(BASE_DIR, 'vagrant')
PROFILES_DIR = File.join(VAGRANT_DIR, 'profiles')
DEFAULT_PROFILE_PATH = File.join(PROFILES_DIR, 'default.json')

# Load default profile
nodes  = MultiJson::load(File.new(DEFAULT_PROFILE_PATH))

# Iterate all configurations form loaded file
Vagrant.configure("2") do |config|
  nodes.each do |node_def|
    config.vm.define node_def['hostname'] do |node|
      node.vm.box = node_def['box']
      node.vm.box_url = node_def['box_url']

      ports = node_def['network']['ports'] || []
      ports.each do |port|
        guest_port = port['guest']
        host_port = port['host']
        node.vm.network 'forwarded_port', guest: guest_port, host: host_port, auto_correct: true
      end

      # Specify and customize virtualization provider
      node.vm.provider 'virtualbox' do |provider|
        provider.customize ['modifyvm', :id, '--memory', 512]
        provider.customize ['modifyvm', :id, '--cpuexecutioncap', '85']
      end

      node.vm.provision :puppet do |puppet|
        # Path to manifests folder
        puppet.manifests_path = 'puppet/manifests'

        # Name of manifest used
        puppet.manifest_file = 'default.pp'

        # Folder where are puppet modules stored
        puppet.module_path = 'puppet/modules'

        # You can specify/override node name from puppet/manifests/default.pp here
        # puppet.puppet_node = 'all'
      end
    end
  end
end
