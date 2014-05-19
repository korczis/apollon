# == Class: rabbitmq
#
# Installs RabbitMQ server.
#
class rabbitmq {
  require core

  # create a directory for temporary files scripts
  file { "/home/vagrant/scripts/rabbitmq":
    ensure => "directory",
  }

  file { "/home/vagrant/scripts/rabbitmq/enable-user-management.sh":
    owner => root,
    group => root,
    mode => 0755,
    source  => 'puppet:///modules/rabbitmq/enable-user-management.sh';
  }

  package { 'rabbitmq-server':
    ensure => present;
  }

  service { 'rabbitmq-server':
    require => Package['rabbitmq-server'],
    ensure => running,
  }

  exec { 'enable-user-management':
    require => [
    	File['/home/vagrant/scripts/rabbitmq/enable-user-management.sh'],
    	Service['rabbitmq-server']
	],
    command => '/home/vagrant/scripts/rabbitmq/enable-user-management.sh'
  }
}
