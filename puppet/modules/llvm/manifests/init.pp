# == Class: llvm
#
# Installs Haskell.
#
class llvm {
	require core
	
	package { 'llvm':
		ensure => present;
	}
}
