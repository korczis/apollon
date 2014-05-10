# == Class: core
#
# Installs core packages
#
class core {
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
}
