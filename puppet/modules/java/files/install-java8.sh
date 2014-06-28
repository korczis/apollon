#! /usr/bin/env bash

CMD="sudo apt-get install -q -yy oracle-java8-installer"
$CMD
while [ $? -ne 0 ]; do
    $CMD
done