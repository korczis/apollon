# == Class: dev
#
# Installs development packages
#
class dev {
	include ghc
	include git
	include llvm
	include nodejs
	include python
	include ruby
	# include rvm
}
