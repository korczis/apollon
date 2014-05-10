#! /usr/bin/env bash

CMD="sudo apt-get install oracle-java7-installer"
$CMD
while [ $? -ne 0 ]; do
    $CMD
done