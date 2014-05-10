# == Class: java
#
# Installs Oracle Java.
#
class java {
  require core

  file { '/home/vagrant/hack-java-license.sh':
    owner => vagrant,
    group => vagrant,
    mode => 0755,
    source  => 'puppet:///modules/java/hack-java-license.sh';
  }

  exec { "hack-java-license":
    require => File['/home/vagrant/hack-java-license.sh'],
    command => "/home/vagrant/hack-java-license.sh"
  }

  package
  { 'oracle-java7-installer':
    require => [
      Exec['hack-java-license'],
    ],
    ensure => present;
  }

  package { 'oracle-java8-installer':
    require => [
      Exec['hack-java-license'],
    ],
    ensure => present;
  }

  exec { "updated-alternatives":
    require => [
      Package['oracle-java7-installer'],
      Package['oracle-java8-installer'],
    ],
    command => "/usr/sbin/update-java-alternatives -s java-8-oracle",
  }
}
