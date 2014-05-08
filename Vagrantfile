# encoding: utf-8

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-14.04-amd64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  
  config.vm.hostname = "apollo-pandoras-box"
  
  # CouchDB
  config.vm.network "forwarded_port", guest: 5984, host: 5985
  
  # Memcached
  config.vm.network "forwarded_port", guest: 11211, host: 11212

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'default.pp'
    puppet.module_path = 'puppet/modules'
  end
end
