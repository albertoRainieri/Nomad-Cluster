
# Nomad Cluster with Vagrant on ARM Host

Nomad Cluster with one master and two clients, on ARM hosts.


## Requirements

Install Vagrant and VMware Fusion as per this guide:
https://sloopstash.com/blog/how-to-build-vm-on-apple-m1-m2-chip-mac-with-vmware-fusion-and-vagrant.html


## Configuration

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