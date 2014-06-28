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
    require => [
      Package['nodejs'],
    ],
    ensure => present;
  }

  package { 'npm':
    require => [
      Package['nodejs-legacy'],
    ],
    ensure => present;
  }

  exec { "npm-install-grunt": 
    require => [
      Package['npm'],
    ],
    command => "/usr/bin/npm install -g grunt grunt-cli",  
    timeout => 3600,
  }

  exec { "npm-install-bower": 
    require => [
      Package['npm'],
    ],
    command => "/usr/bin/npm install -g bower",  
    timeout => 3600,
  }
}
