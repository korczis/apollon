# == Class: core
#
# Installs core packages
#
class core {
	exec { "apt-update":
	    command => "/usr/bin/apt-get update",
	}

	exec { "apt-upgrade":
	    command => "/usr/bin/apt-get upgrade -y",
	}
}
