# == Class: dev
#
# Installs development packages
#
class dev::all {
  include clang
  include cmake
  include erlang
  include ghc
  include git
  include golang
  include java
  include llvm
  include llvm
  include nodejs
  include php5
  include python
  #  include ruby
  include rvm
}
