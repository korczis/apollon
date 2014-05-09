# == Class: memcache
#
# Installs Memcached and sets config file.
#
class redis {
  require core

  package { 'redis-server':
    ensure => present;
  }

  # service { 'redis':
  #   ensure => running,
  #   enable  => true,
  #   hasrestart => true,
  #   hasstatus => true,
  #   require => Package['redis-server'];
  # }
}
