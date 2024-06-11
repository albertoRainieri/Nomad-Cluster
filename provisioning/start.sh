#!/bin/bash
# List the VMs Hostnames
vms=("consul" "nmaster" "nclient1")
# Start the VM, if succesfull provision the vm
set -e -o xtrace
for vm in "${vms[@]}"; do vagrant up "$vm"; done
set +e
for vm in "${vms[@]}"; do vagrant provision $vm; done