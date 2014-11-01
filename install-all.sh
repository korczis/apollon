#! /usr/bin/env bash

sudo puppet apply --modulepath=data/puppet/modules data/puppet/manifests/all.pp

