# == Class: curl
#
# Installs curl.
#
class curl {
  package { 'curl':
    ensure => present;
  }
}
