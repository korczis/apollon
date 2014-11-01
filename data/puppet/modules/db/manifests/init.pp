# == Class: db
#
# Installs All Databases
#
class db::all {
  include couchdb
  include elasticsearch
  include memcache
  include mongodb
  include mysql
  # include postgresql
  include redis
}
