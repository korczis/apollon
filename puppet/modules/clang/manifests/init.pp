# == Class: clang
#
# Installs clang.
#
class clang {
  require core

  package { 'clang':
    ensure => present;
  }
}
