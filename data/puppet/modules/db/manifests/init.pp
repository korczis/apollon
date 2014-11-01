# == Class: db
#
# Installs All Databases
#
class db::all {
  include couchbase
  include couchdb
  include elasticsearch
  include memcache
  include mongodb
  include mysql
  # include postgresql
  include redis
}
