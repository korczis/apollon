# == Class: golang
#
# Installs Go language.
#
class golang {
  require core

  package { 'golang':
    ensure => present;
  }
}
