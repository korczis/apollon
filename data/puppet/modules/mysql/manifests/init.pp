# == Class: mysql
#
# Installs mysql server package
#
class mysql {
  require core

  package { 'mysql-server':
    ensure => present;
  }

  file { '/etc/mysql/debian.cnf':
    source  => 'puppet:///modules/mysql/debian.cnf',
    owner => root,
    group => root,
    require => Package['mysql-server'],
    notify  => Service['mysql'];
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    owner => root,
    group => root,
    require => Package['mysql-server'],
    notify  => Service['mysql'];
  }
  
  file { '/etc/mysql/conf.d/mysqld_safe_syslog.cnf':
    source  => 'puppet:///modules/mysql/conf.d/mysqld_safe_syslog.cnf',
    owner => root,
    group => root,
    require => Package['mysql-server'],
    notify  => Service['mysql'];
  }

  service { 'mysql':
    ensure  => running,
    require => [
      Package['mysql-server'],
      File['/etc/mysql/debian.cnf'],
      File['/etc/mysql/my.cnf'],
      File['/etc/mysql/conf.d/mysqld_safe_syslog.cnf']
    ];
  }
}
