# == Class: erlang
#
# Installs erlang.
#
class erlang {
  require core

  package { 'erlang':
    ensure => present;
  }
}
