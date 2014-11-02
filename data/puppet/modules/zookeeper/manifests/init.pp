# == Class: zookeeper
#
# Installs Zookeeper.
#
class zookeeper {
  require core
  require java8

  package { 'zookeeper':
    ensure => present;
  }

  package { 'zookeeper-bin':
  	require => Package['zookeeper'],
    ensure => present;
  }

  package { 'zookeeperd':
  	require => Package['zookeeper'],
    ensure => present;
  }

  service { 'zookeeper':
    require => Package['zookeeperd'],
    ensure => running,
  }
}
