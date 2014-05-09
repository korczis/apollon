# == Class: mosh
#
# Installs mosh package
#
class mosh {
	require core

	package { 'mosh': 
		ensure => present;
	}
}
