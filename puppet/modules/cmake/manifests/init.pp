# == Class: cmake
#
# Installs cmake.
#
class cmake {
  require core

  package { 'cmake':
    ensure => present;
  }
}
