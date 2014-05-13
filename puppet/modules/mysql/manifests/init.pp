# == Class: mysql
#
# Installs mysql server package
#
class mysql {
  require core

  package { 'mysql-server':
    ensure => present;
  }
}
