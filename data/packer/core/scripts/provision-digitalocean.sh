#! /usr/bin/env bash

echo "Basic provisioning using bash script is happening right now ..."

echo "Creating home directory"
mkdir -p /home/apollon

echo "Creating user and adding user to sudo group"
useradd -m -U -G sudo -b /home -p apollon apollon

echo "Changing ownership of home directory"
chown -R apollon:apollon /home/apollon

echo "Adding user to sudoers"
echo "apollon   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; sync;
