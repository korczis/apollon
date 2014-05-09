# == Class: rvm
#
# Installs rvm package
#
class rvm {
	exec { "rvm-install":
	    command => "curl -sSL https://get.rvm.io | bash",
	}
}
