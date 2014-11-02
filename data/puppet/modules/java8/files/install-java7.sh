#! /usr/bin/env bash

CMD="sudo apt-get install -q -yy oracle-java7-installer"
$CMD
while [ $? -ne 0 ]; do
    $CMD
done