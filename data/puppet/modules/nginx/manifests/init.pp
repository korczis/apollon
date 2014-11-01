# == Class: nginx
#
# Installs Nginx Web Server and sets config file.
#
class nginx {
  require core
	
  package { 'nginx-light':
    ensure => present;
  }

  package { 'apache2':
    ensure => absent;
  }

  service { 'nginx':
    ensure  => running,
    require => Package['nginx-light'];
  }
}
