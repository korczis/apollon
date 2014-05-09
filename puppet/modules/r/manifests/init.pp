# == Class: r
#
# Installs R Language.
#
class r {
require core

package { 'r-base':
    ensure => present;
  }
}
