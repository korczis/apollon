# == Class: llvm
#
# Installs llvm.
#
class llvm {
  require core

  package { 'llvm':
    ensure => present;
  }
}
