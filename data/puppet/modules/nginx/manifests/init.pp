# == Class: nginx
#
# Installs Nginx Web Server and sets config file.
#
class nginx {
  require core
	
  package { 'nginx-light':
    ensure => present;
  }

  service { 'nginx':
    ensure  => running,
    require => Package['nginx-light'];
  }
}
