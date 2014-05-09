
# == Class: ops
#
# Installs usefull tools for operators (humans) of box
#
class ops {
	require core
	
	include htop
	include mc
	include mosh
}
