
# Devops Overview

This repository contain different Devops project to build in local environment.
These environments are built through the use of Vagrant and Ansible:
I'm using a Mac OS M2, so everything is set up to work on ARM architecture.

You can find different projects (working in progress):

1) Nomad Cluster with Consul And Haproxy (completed)
2) Monitoring (to create)
3) CI-CD (to create)


## Requirements

1. Install Vagrant and VMware Fusion as per this guide:
```
https://sloopstash.com/blog/how-to-build-vm-on-apple-m1-m2-chip-mac-with-vmware-fusion-and-vagrant.html
```

2. Install Ansible
```
brew install ansible
```


## Configuration

First of all, copy file hosts in ansible directory
```
$ cp provisioning/hosts /etc/ansible/hosts
```

Select the preferred Vagrantfile from provisioning/vagrant_dir:
```
$ cp provisioning/vagrant_dir/<Vagrantfile> /provisioning/Vagrantfile
$ cd provisioning
$ vagrant up
```


Modify the Vagrantfile according to your needs (ip address, hostname, cpu, memory).


## Installation

Launch Nomad cluster through vagrant cli:

```
$ vagrant up
```

## UI Visualization

Regarding the Nomad-Consul-Haproxy project,
Haproxy runs on the "consul" node, therefore if you set up properly your /etc/hosts file, you can reach the following websites:

```
Nomad: nomad.example.com
Consul: consul.example.com
Httpd page: httpd.example.com
```

## Note
