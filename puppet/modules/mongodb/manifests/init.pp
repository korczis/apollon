# == Class: mongodb
#
# Installs MongoDB and sets config file.
#
class mongodb {
  package { 'mongodb':
    ensure => present;
  }

  service { 'mongodb':
    ensure  => running,
    require => Package['mongodb'];
  }

  file { '/etc/mongodb.conf':
    owner => root,
    group => root,
    source  => 'puppet:///modules/mongodb/mongodb.conf',
    require => Package['mongodb'],
    notify  => Service['mongodb'];
  }
}
