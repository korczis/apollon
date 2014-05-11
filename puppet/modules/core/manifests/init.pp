# == Class: core
#
# Installs core packages
#
class core {
  # create a directory for vagrant scripts
  file { "/home/vagrant/scripts":
    ensure => "directory",
  }

  # create a directory for temporary files scripts
  file { "/home/vagrant/tmp":
    ensure => "directory",
  }

  exec { "add-webupd8team-java-ppa":
    command => "/usr/bin/add-apt-repository ppa:webupd8team/java",
  }

  exec { "apt-update":
    require => Exec['add-webupd8team-java-ppa'],
    command => "/usr/bin/apt-get update",
  }

  exec { "apt-upgrade":
    require => Exec['apt-update'],
    command => "/usr/bin/apt-get upgrade -y",
  }

  exec { "core-done":
    require => [
      Exec['apt-upgrade'],
      File['/home/vagrant/tmp'],
      File['/home/vagrant/scripts']
    ],
    command => "/bin/echo Core Init done",
  }
}
