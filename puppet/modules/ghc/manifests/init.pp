# == Class: ghc
#
# Installs Haskell.
#
class ghc {
  require core

  package { 'ghc':
    ensure => present;
  }
}
