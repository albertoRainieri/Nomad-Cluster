#!/bin/bash
vms=("consul" "nmaster" "nclient1" "nclient2")
for vm in "${vms[@]}"; do vagrant up "$vm" && vagrant provision $vm; done