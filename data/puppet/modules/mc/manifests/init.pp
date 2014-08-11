# == Class: mc
#
# Installs mc package
#
class mc {
  require core

  package { 'mc':
    ensure => present;
  }
}
