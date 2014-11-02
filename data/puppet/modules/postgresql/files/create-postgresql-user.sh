#! /usr/bin/env bash

/usr/bin/createuser -s -d -r -e -P apollon
/usr/bin/psql -U postgres -d postgres -c "alter user apollon with password 'apollon';"
