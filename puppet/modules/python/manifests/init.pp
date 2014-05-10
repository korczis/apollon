# == Class: python
#
# Installs Python.
#
class python {
  require core

  package { 'python':
    ensure => present;
  }
}
