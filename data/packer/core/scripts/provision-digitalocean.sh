#! /usr/bin/env bash

echo "Basic provisioning using bash script is happening right now ..."

sudo mkdir -p /home/vagrant

sudo useradd -m -U -G sudo -b /home/vagrant -p vagrant vagrant

chown -R vagrant:vagrant /home/vagrant

sudo echo "vagrant   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; sync;
