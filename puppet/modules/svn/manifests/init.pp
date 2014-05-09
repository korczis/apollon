# == Class: svn
#
# Installs Subversion tools.
#
class svn {
	require core
	
	package { 'svn':
		ensure => present;
	}
}
