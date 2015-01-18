# Apollon

Your own personal cluster built on top of the cloud.

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

## Cloud providers

- Digital Ocean
- AWS

## Reference

- [Kubernetes Fleet Flannel](https://github.com/kelseyhightower/kubernetes-fleet-tutorial)
- [How to use fleet and fleetctl to manage your coreos cluster](https://www.digitalocean.com/community/tutorials/how-to-use-fleet-and-fleetctl-to-manage-your-coreos-cluster)
- [fleetctl client documentation](https://github.com/coreos/fleet/blob/master/Documentation/using-the-client.md)
