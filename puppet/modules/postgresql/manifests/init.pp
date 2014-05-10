# == Class: postgresql
#
# Installs PostgreSQL and sets config file.
#
class postgresql {
  require core
	
  package { 'postgresql':
    ensure => present;
  }

  service { 'postgresql':
    ensure  => running,
    require => [
      Package['postgresql'],
      File['/etc/postgresql/9.3/main/environment'],
      File['/etc/postgresql/9.3/main/pg_ctl.conf'],
      File['/etc/postgresql/9.3/main/pg_hba.conf'],
      File['/etc/postgresql/9.3/main/pg_ident.conf'],
      File['/etc/postgresql/9.3/main/postgresql.conf'],
      File['/etc/postgresql/9.3/main/start.conf'],
    ];
  }

  file { '/etc/postgresql/9.3/main/environment':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/environment',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/pg_ctl.conf':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/pg_ctl.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/pg_hba.conf':
    owner => postgres,
    group => postgres,
    mode => 0640,
    source  => 'puppet:///modules/postgresql/9.3/main/pg_hba.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/pg_ident.conf':
    owner => postgres,
    group => postgres,
    mode => 0640,
    source  => 'puppet:///modules/postgresql/9.3/main/pg_ident.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/postgresql.conf':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/postgresql.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }

  file { '/etc/postgresql/9.3/main/start.conf':
    owner => postgres,
    group => postgres,
    source  => 'puppet:///modules/postgresql/9.3/main/start.conf',
    require => Package['postgresql'],
    notify  => Service['postgresql'];
  }
}
