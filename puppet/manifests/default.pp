node default {
  include core
}

node all {
  include db::all
  include dev
  include ops
  include rabbitmq
  include science
  include web::all
}

node dev {
  include dev
}

node db {
  include db::all
}

node ops {
  include ops
}

node web {
  include web::all
}
