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

  file { "/etc/tomcat7/tomcat-users.xml":
    require => Package['tomcat7-admin'];
    owner => root,
    group => tomcat7,
    source  => 'puppet:///modules/tomcat7/tomcat-users.xml';
  }
}
