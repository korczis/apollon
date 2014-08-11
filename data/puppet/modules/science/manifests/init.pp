# == Class: science
#
# Installs scientific tools.
#
class science::all {
  include octave
  include r
}
