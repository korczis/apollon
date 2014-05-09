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
    require => Package['postgresql'];
  }
}
