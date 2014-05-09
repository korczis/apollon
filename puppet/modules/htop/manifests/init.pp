# == Class: htop
#
# Installs htop package
#
class htop {
	require core
	
	package { 'htop': 
		ensure => present;
	}
}
