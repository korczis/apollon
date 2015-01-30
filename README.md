# Apollon

Your own personal cluster built on top of the cloud.

## Status

[![Build Status](https://travis-ci.org/korczis/apollon.svg?branch=master)](https://travis-ci.org/korczis/apollon)
[![Code Climate](https://codeclimate.com/github/korczis/apollon/badges/gpa.svg)](https://codeclimate.com/github/korczis/apollon)
[![Coverage Status](https://coveralls.io/repos/korczis/apollon/badge.svg?branch=master)](https://coveralls.io/r/korczis/apollon?branch=master)

## Prerequisites

- CoreOS
- Docker
- Etcd

## Technologies

- Docker (engaged)
- Fleet (engaged)
- Flannel
- Kubernetes
- Mesos
- AWS Route 53

## Getting started

### Gem

If you want to get started using gem it is simple as..

```
gem install apollon
```

### Github

If you want to use [Apollon](https://github.com/korczis/apollon) from sources all you need to do is ...

```
# Clone repository
git clone https://github.com/korczis/apollon.git

# Enter repository
cd apollon

# Init submodules
git submodule init

# Update submodules
git submodule update
```

## Usage

### apollon

```
tomaskorcak@kx-mac apollon $ apollon
NAME
    apollon - Apollon 0.1.0

SYNOPSIS
    apollon [global options] command [command options] [arguments...]

GLOBAL OPTIONS
    --help - Show this message

COMMANDS
    auth     - Authentication
    cluster  - High Level Cluster management
    help     - Shows a list of commands or help for one command
    machine  - Machine(s) manager
    provider - Provider(s) manager
    version  - Print version info
```

### apollon version

```
tomaskorcak@kx-mac apollon$ apollon version
"0.1.0"
```

## Cloud providers

- Digital Ocean
- AWS

## Reference

- [Kubernetes Fleet Flannel](https://github.com/kelseyhightower/kubernetes-fleet-tutorial)
- [Kubernetes on CoreOS](https://github.com/kelseyhightower/kubernetes-coreos)
- [How to use fleet and fleetctl to manage your coreos cluster](https://www.digitalocean.com/community/tutorials/how-to-use-fleet-and-fleetctl-to-manage-your-coreos-cluster)
- [fleetctl client documentation](https://github.com/coreos/fleet/blob/master/Documentation/using-the-client.md)
- [CoreOS Architectures](https://coreos.com/docs/cluster-management/setup/cluster-architectures/)
- [Coreos, Kubernetes and DigitalOcean](https://github.com/bketelsen/coreos-kubernetes-digitalocean)
- [Fleet Deployment and Configuration](https://github.com/coreos/fleet/blob/master/Documentation/deployment-and-configuration.md)
- [Flannel Official Documentation](https://github.com/coreos/flannel/blob/master/README.md)
