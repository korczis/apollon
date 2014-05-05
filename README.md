# apollo-fat-box

Big, fat and heavy-weight vagrant box containing lot of tools and libs for data science.

## About

What is this heavy-weight box for? For super-quick prototyping. 

Yes. You know that.

1. You got an idea. You want to immediately start working on it. 
2. You realize you need to setup development envrionment with all the tools and stuff.

That is what this fat boy is here for.
It can be made up and running with [few commands](https://github.com/korczis/apollo-fat-box#getting-started).

## What is included

Lot of usefull stuff, for full list see [WHATS_IN.md](https://github.com/korczis/apollo-uber-box/blob/master/WHATS_IN.md)

- Databases - couchdb, memcached, mongodb, postgresql, redis, ...
- Programming Languages - c, c++, clojure, node.js, ruby/rvm, scala, ...
- Tools - mocha, ...

Again, for full list see [WHATS_IN.md](https://github.com/korczis/apollo-uber-box/blob/master/WHATS_IN.md)

## Getting Started

```
# Clone this repo containging Vagrantfile with vagrant settings
git clone https://github.com/korczis/apollo-uber-box.git

# Enter the folder with Vagrantfile, be aware of trailing box folder in path!
cd apollo-uber-box/box

# Kick off the vagrant up process
vagrant up
```

## Logging in

For loggining-in use vagrant ssh.

```
vagrant ssh
```

## Destroying instance 

Destroy instance using vagrant destroy.

```
vagrant destroy
```

## TODO

For list of TODO stuff see [TODO.md](https://github.com/korczis/apollo-uber-box/blob/master/TODO.md)

## Credits

- [@pavelbinar](https://github.com/pavelbinar) for QA and not just that.
