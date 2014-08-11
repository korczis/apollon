node default {
  include db::all
  include dev::all
  include ops::all
  include science::all
  include web::all
  
  include rabbitmq
  include zookeeper
}