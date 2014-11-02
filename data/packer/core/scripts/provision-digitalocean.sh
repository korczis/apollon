#! /usr/bin/env bash

echo "Basic provisioning using bash script is happening right now ..."

mkdir -p /home/apollon

useradd -m -U -G sudo -b /home/apollon -p apollon apollon

chown -R apollon:apollon /home/apollon

echo "apollon   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; sync;
