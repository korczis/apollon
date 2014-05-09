# == Class: dev
#
# Installs development packages
#
class dev {
  include clang
  include cmake
  include erlang
  include ghc
  include git
  include llvm
  include nodejs
  include python
  include ruby
  # include rvm
}
