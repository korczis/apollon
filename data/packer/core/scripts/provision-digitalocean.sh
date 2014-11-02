#! /usr/bin/env bash

echo "Basic provisioning using bash script is happening right now ..."

sudo mkdir -p /home/vagrant

sudo useradd -m -U -G sudo -b /home/apollon -p apollon apollon

chown -R apollon:apollon /home/apollon

sudo echo "apollon   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; sync;
