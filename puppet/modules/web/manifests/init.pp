# == Class: web
#
# Installs All Web Application stuff
#
class web::all {
	include nginx
	include squid
}
