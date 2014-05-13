# == Class: php5
#
# Installs php5 package
#
class apache2 {
  require core

  package { 'apache2':
    ensure => present;
  }

  file { '/etc/apache2/apache2.conf':
    source  => 'puppet:///modules/apache2/apache2.conf',
    require => Package['apache2'],
    notify  => Service['apache2'];
  }

  file { '/etc/apache2/envvars':
    source  => 'puppet:///modules/apache2/envvars',
    require => Package['apache2'],
    notify  => Service['apache2'];
  }

  file { '/etc/apache2/magic':
    source  => 'puppet:///modules/apache2/magic',
    require => Package['apache2'],
    notify  => Service['apache2'];
  }

  file { '/etc/apache2/ports.conf':
    source  => 'puppet:///modules/apache2/ports.conf',
    require => Package['apache2'],
    notify  => Service['apache2'];
  }

  service { 'apache2':
    ensure  => running,
    require => [
      Package['apache2'],
      File['/etc/apache2/apache2.conf'],
      File['/etc/apache2/envvars'],
      File['/etc/apache2/magic'],
      File['/etc/apache2/ports.conf']
    ];
  }
}
