
# == Class: ops
#
# Installs usefull tools for operators (humans) of box
#
class ops::all {
  include htop
  include links
  include lynx
  include mc
  include mosh
}
