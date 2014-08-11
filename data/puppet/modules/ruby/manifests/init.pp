# == Class: ruby
#
# Installs Ruby.
#
class ruby {
	require core
	
	package { 'ruby':
		ensure => present;
	}
}
