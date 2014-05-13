# == Class: php5
#
# Installs php5 package
#
class php5 {
  require core

  package { 'php5':
    ensure => present;
  }
}
