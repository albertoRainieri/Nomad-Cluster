#!/bin/bash
provider='vmware_fusion'
#provider='virtualbox'
vm1_hostname='consul'
vm2_hostname='nmaster'
vm3_hostname='nclient1'

vm1_ip=192.168.217.103
vm2_ip=192.168.217.100
vm3_ip=192.168.217.101

path_ssh='/Users/albertorainieri/.ssh/known_hosts'
path_vagrant_vm='/Users/albertorainieri/Learning/Nomad/provisioning/.vagrant/machines'


# ssh-keygen -f "$path_ssh" -R $vm1_ip
# ssh-keygen -f "$path_ssh" -R $vm2_ip
# ssh-keygen -f "$path_ssh" -R $vm3_ip


eval `ssh-agent -s`

ssh-add "$path_vagrant_vm/$vm1_hostname/$provider/private_key"
sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=accept-new vagrant@"$vm1_ip" "echo hello $vm1_hostname"
sleep 1
ssh-add "$path_vagrant_vm/$vm2_hostname/$provider/private_key"
sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=accept-new vagrant@"$vm2_ip" "echo hello $vm2_hostname"
sleep 1
ssh-add "$path_vagrant_vm/$vm3_hostname/$provider/private_key"
sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=accept-new vagrant@"$vm3_ip" "echo hello $vm3_hostname"
sleep 1

