# == Class: core
#
# Installs core packages
#
class core {
  # create a directory for apollon scripts
  file { "/home/apollon/scripts":
    ensure => "directory",
  }

  # create a directory for temporary files scripts
  file { "/home/apollon/tmp":
    ensure => "directory",
  }

  file { "/etc/apt/sources-new.list":
    owner => root,
    group => root,
    source  => 'puppet:///modules/core/sources.list';
  }

  exec { "update-sources": 
    require => [
      File['/etc/apt/sources-new.list'],
    ],
    command => "/usr/bin/apt-get update -q -yy",
    timeout => 3600,
  }

  exec { "update-certs":
    require => Exec['update-sources'],
    command => "/usr/bin/apt-get install -q -yy --reinstall ca-certificates",
  }

  exec { "add-webupd8team-java-ppa":
    require => Exec['update-certs'],
    command => "/usr/bin/add-apt-repository ppa:webupd8team/java",
  }

  exec { "apt-update":
    require => [
      Exec['add-webupd8team-java-ppa'],
      Exec['update-sources']
    ],
    command => "/usr/bin/apt-get update -yy",
    timeout => 3600,
  }

  exec { "apt-upgrade":
    require => Exec['apt-update'],
    command => "/usr/bin/apt-get upgrade -yy --force-yes -qq",
    timeout => 3600,
    logoutput => on_failure
  }

  exec { "core-done":
    require => [
      Exec['apt-upgrade'],
      File['/home/apollon/tmp'],
      File['/home/apollon/scripts'],
    ],
    command => "/bin/echo Core Init done",
  }
}
