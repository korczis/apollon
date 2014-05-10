#! /usr/bin/env bash

CMD="sudo apt-get install oracle-java8-installer"
$CMD
while [ $? -ne 0 ]; do
    $CMD
done