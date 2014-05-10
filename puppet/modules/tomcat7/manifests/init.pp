# == Class: tomcat7
#
# Installs Tomcat7.
#
class tomcat7 {
  require core
  require java

  package { 'tomcat7':
    ensure => present;
  }

  package { 'tomcat7-admin':
    ensure => present,
    require => Package['tomcat7'];
  }
}
