# == Class: nodejs
#
# Installs nodejs.
#
class nodejs {
  require core

  package { 'nodejs':
    ensure => present;
  }

  package { 'nodejs-legacy':
    ensure => present;
  }
}
