# == Class: varnish
#
# Installs varnish.
#
class varnish {
  require core

  package { 'varnish':
    ensure => present;
  }
}
