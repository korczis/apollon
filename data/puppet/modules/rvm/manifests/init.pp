# == Class: rvm
#
# Installs rvm package
#
class rvm {
  require core

  $rvm_user = "root"

  exec { "rvm-install":
    user => $rvm_user,
    command => "/usr/bin/curl -sSL https://get.rvm.io | bash",
  }

  exec { "rvm-install-2.0":
    require => Exec['rvm-install'],
    user => $rvm_user,
    command => '/usr/local/rvm/bin/rvm install 2.0',
    timeout => 3600
  }

  exec { "rvm-use-2.0":
    require => Exec['rvm-install-2.0'],
    user => $rvm_user,
    command => '/usr/local/rvm/bin/rvm use --default 2.0'
  }

  exec { "rvm-install-bundler":
    require => Exec["rvm-use-2.0"],
    user => $rvm_user,
    command => '/usr/bin/gem install bundler'
  }
}
