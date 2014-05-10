# == Class: rabbitmq
#
# Installs RabbitMQ server.
#
class rabbitmq {
  require core

  package { 'rabbitmq-server':
    ensure => present;
  }

  service { 'rabbitmq-server':
    require => Package['rabbitmq-server'],
    ensure => running,
  }
}
