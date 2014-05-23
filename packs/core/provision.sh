#! /usr/bin/env bash

echo "Basic provisioning using bash script is happening right now ..."

mount /dev/cdrom /mnt
cd /mnt
./VBoxLinuxAdditions.run
