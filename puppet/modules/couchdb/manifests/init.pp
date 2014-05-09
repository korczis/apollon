# == Class: couchdb
#
# Installs CouchDB.
#
class couchdb {
  require core

  package { 'couchdb':
    ensure => present;
  }

  service { 'couchdb':
    ensure  => running,
    require => Package['couchdb'];
  }

  file { '/etc/couchdb/local.ini':
    owner => couchdb,
    group => couchdb,
    mode => 0640,
    source  => 'puppet:///modules/couchdb/local.ini',
    require => Package['couchdb'],
    notify  => Service['couchdb'];
  }
}
