# == Class: octave
#
# Installs Octave.
#
class octave {
  require core

  package { 'octave':
    ensure => present;
  }
}
