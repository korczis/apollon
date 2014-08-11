# == Class: squid
#
# Installs Squid proxy sets config file.
#
class squid {
  require core
	
  package { 'squid':
    ensure => present;
  }

  # service { 'squid':
  #   ensure  => running,
  #   require => Package['squid'];
  # }
}
