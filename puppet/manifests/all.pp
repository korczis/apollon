node default {
  include db::all
  include dev
  include ops
  include rabbitmq
  include science
  include web::all
  include zookeeper
}