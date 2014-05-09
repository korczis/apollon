
# == Class: ops
#
# Installs usefull tools for operators (humans) of box
#
class ops {
  include htop
  include links
  include lynx
  include mc
  include mosh
}
