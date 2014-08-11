# == Class: lynx
#
# Installs lynx browser.
#
class lynx {
  require core

  package { 'lynx':
    ensure => present;
  }
}
