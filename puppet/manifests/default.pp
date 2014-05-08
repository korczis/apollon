exec { "apt-update":
    command => "/usr/bin/apt-get update",
}

exec { "apt-upgrade":
    command => "/usr/bin/apt-get upgrade -y",
}

node default {
	include couchdb, memcache, mongodb
}
