# == Class: java8
#
# Installs Oracle Java.
#
class java8 {
  require core

  # Copy script which bypass java EULA
  file { '/home/apollon/accept-java-license.sh':
    owner => apollon,
    group => apollon,
    mode => 0755,
    source  => 'puppet:///modules/java8/accept-java-license.sh';
  }

  # Copy script for installing java 7
  file { '/home/apollon/install-java7.sh':
    owner => apollon,
    group => apollon,
    mode => 0755,
    source  => 'puppet:///modules/java8/install-java7.sh';
  }

  # Copy script for installing java 8
  file { '/home/apollon/install-java8.sh':
    owner => apollon,
    group => apollon,
    mode => 0755,
    source  => 'puppet:///modules/java8/install-java8.sh';
  }

  # Run script for bypassing java EULA
  exec { "accept-java-license":
    require => File['/home/apollon/accept-java-license.sh'],
    command => "/home/apollon/accept-java-license.sh"
  }

  # Install Oracle Java 7 Installer
  # exec { "oracle-java7-install-script":
  #   require => [
  #     Exec['accept-java-license'],
  #     File['/home/apollon/install-java7.sh']
  #   ],
  #   logoutput => true,
  #   command => "/home/apollon/install-java7.sh"
  # }

  # Install Oracle Java 8 Installer
  # exec { "oracle-java8-install-script":
  #   require => [
  #     Exec['accept-java-license'],
  #     File['/home/apollon/install-java8.sh'],
  #   ],
  #   logoutput => true,
  #   command => "/home/apollon/install-java8.sh"
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
