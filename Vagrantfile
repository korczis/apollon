# encoding: utf-8

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-14.04-amd64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "apollo-pandoras-box"

  # CouchDB
  config.vm.network "forwarded_port", guest: 5984, host: 5985

  # Elasticsearch
  config.vm.network "forwarded_port", guest: 9200, host: 9201

  # Memcached
  config.vm.network "forwarded_port", guest: 11211, host: 11212

  # MongoDB
  config.vm.network "forwarded_port", guest: 27017, host: 27018
  config.vm.network "forwarded_port", guest: 28017, host: 28018

  # Specify and customize virtualization provider
  config.vm.provider "virtualbox" do |provider|
    provider.customize ["modifyvm", :id, "--memory", 2048]
    provider.customize ["modifyvm", :id, "--cpuexecutioncap", "85"]
  end

  config.vm.provision :puppet do |puppet|
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
