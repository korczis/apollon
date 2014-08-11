#! /usr/bin/env bash

/usr/bin/createuser -s -d -r -e -P vagrant
/usr/bin/psql -U postgres -d postgres -c "alter user vagrant with password 'vagrant';"
