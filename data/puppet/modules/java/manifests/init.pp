# == Class: java
#
# Installs Oracle Java.
#
class java {
  require core

  # Copy script which bypass java EULA
  file { '/home/vagrant/accept-java-license.sh':
    owner => vagrant,
    group => vagrant,
    mode => 0755,
    source  => 'puppet:///modules/java/accept-java-license.sh';
  }

  # Copy script for installing java 7
  file { '/home/vagrant/install-java7.sh':
    owner => vagrant,
    group => vagrant,
    mode => 0755,
    source  => 'puppet:///modules/java/install-java7.sh';
  }

  # Copy script for installing java 8
  file { '/home/vagrant/install-java8.sh':
    owner => vagrant,
    group => vagrant,
    mode => 0755,
    source  => 'puppet:///modules/java/install-java8.sh';
  }

  # Run script for bypassing java EULA
  exec { "accept-java-license":
    require => File['/home/vagrant/accept-java-license.sh'],
    command => "/home/vagrant/accept-java-license.sh"
  }

  # Install Oracle Java 7 Installer
  # exec { "oracle-java7-install-script":
  #   require => [
  #     Exec['accept-java-license'],
  #     File['/home/vagrant/install-java7.sh']
  #   ],
  #   logoutput => true,
  #   command => "/home/vagrant/install-java7.sh"
  # }

  # Install Oracle Java 8 Installer
  # exec { "oracle-java8-install-script":
  #   require => [
  #     Exec['accept-java-license'],
  #     File['/home/vagrant/install-java8.sh'],
  #   ],
  #   logoutput => true,
  #   command => "/home/vagrant/install-java8.sh"
  # }

  package { 'oracle-java7-installer':
    require => Exec['accept-java-license'],
    ensure => present,
  }

  package { 'oracle-java8-installer':
    require => Exec['accept-java-license'],
    ensure => present,
  }

  # package { 'openjdk-7-jdk':
  #   ensure => present,
  # }

  # package { 'openjdk-8-jdk':
  #   ensure => present,
  # }

  # Update java alternatives
  exec { "updated-alternatives":
    require => [
      Package['oracle-java7-installer'],
      Package['oracle-java8-installer'],
      # Exec['oracle-java7-install-script'],
      # Exec['oracle-java8-install-script'],
    ],
    command => "/usr/sbin/update-java-alternatives -s java-8-oracle",
  }
}
