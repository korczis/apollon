# == Class: git
#
# Installs Git tools.
#
class git {
	require core
	
	package { 'git':
		ensure => present;
	}
}
