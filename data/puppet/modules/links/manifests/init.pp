# == Class: links
#
# Installs links browser.
#
class links {
  require core

  package { 'links':
    ensure => present;
  }
}
