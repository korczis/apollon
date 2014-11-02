# == Class: wget
#
# Installs wget.
#
class wget {
  package { 'wget':
    ensure => present;
  }
}
