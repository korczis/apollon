# == Class: elasticsearch
#
# Installs development packages
#
class elasticsearch {
  require core
  require java

  exec { "elasticsearch-download":
    command => "/usr/bin/wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.deb"
  }

  exec { "elasticsearch-install":
    require => Exec["elasticsearch-download"],
    command => "/usr/bin/dpkg -i /home/vagrant/elasticsearch-1.1.1.deb"
  }

  exec { "elasticsearch-service":
    require => Exec["elasticsearch-install"],
    command => "/usr/sbin/update-rc.d elasticsearch defaults 95 10"
  }

  file { '/etc/elasticsearch/elasticsearch.yml':
    owner => root,
    group => root,
    source  => 'puppet:///modules/elasticsearch/elasticsearch.yml',
    require => Exec['elasticsearch-install']
  }

  file { '/etc/elasticsearch/logging.yml':
    owner => root,
    group => root,
    source  => 'puppet:///modules/elasticsearch/logging.yml',
    require => Exec['elasticsearch-install']
  }

  service { 'elasticsearch':
    ensure  => running,
    require => [
      File['/etc/elasticsearch/elasticsearch.yml'],
      File['/etc/elasticsearch/logging.yml'],
      Exec['elasticsearch-service']
    ]
  }
}
