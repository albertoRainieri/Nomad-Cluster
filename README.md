
# Devops Overview

This project contain different projects Devops to build in local environment.
The Environments are built through the use of Vagrant and Ansible:
I'm using a MAC M2, so everything is set up to work on ARM architecture.

You can find different projects (working in progress):

1) Nomad Cluster with Consul And Haproxy (completed)
2) Monitoring (to create)
3) CI-CD (to create)


## Requirements

Install Vagrant and VMware Fusion as per this guide:
https://sloopstash.com/blog/how-to-build-vm-on-apple-m1-m2-chip-mac-with-vmware-fusion-and-vagrant.html

Install Ansible
```
brew install ansible
```


## Configuration

First of all copy file hosts in ansible directory
```
$ cp provisioning/hosts /etc/ansible/hosts
```

Select the preferred Vagrant from provisioning/vagrant_dir:
```
$ cp provisioning/vagrant_dir/<Vagrantfile> /provisioning/Vagrantfile
$ cd provisioning
$ vagrant up
```


Modify the Vagrantfile according to your needs (ip address, hostname, cpu, memory).
If you change ip address and hostname, you should also adjust the config files in the /config directory


## Installation

Launch Nomad cluster through vagrant cli:

```
$ vagrant up
```

## UI Visualization

Go to \<ip-address-nomad-master\>:4646/ui/jobs

## Launch Test Job

from your host:

```
$ vagrant ssh nmaster
$ nomad job run /vagrant/jobs/busybox.hcl
```

## Note
in config/nomad_client_config.sh, the "cpu_total_compute" in the client section has been set manually because Nomad was failing to detect dynamically the cpu. Delete this line in case you do not have this problem or change it if you set a different number of cpu processors on the client node.