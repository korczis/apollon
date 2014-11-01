# == Class: couchbase
#
# Installs development packages
#
class couchbase {
  require core
  require erlang

  exec { "couchbase-download":
    command => "/usr/bin/wget -P /home/vagrant/tmp http://packages.couchbase.com/releases/3.0.1/couchbase-server-community_3.0.1-ubuntu12.04_amd64.deb"
  }

  exec { "couchbase-install":
    require => Exec["couchbase-download"],
    command => "/usr/bin/dpkg -i /home/vagrant/tmp/couchbase-server-community_3.0.1-ubuntu12.04_amd64.deb"
  }

  service { 'couchbase-server':
    ensure  => running,
    require => [
      Exec['couchbase-install']
    ]
  }
}
