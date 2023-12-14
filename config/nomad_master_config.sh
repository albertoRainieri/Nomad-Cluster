#!/bin/bash

#Enable Port forwarding
echo "[TASK 1] Enable Port forwarding"
sudo sh -c 'echo "49152 65535" > /proc/sys/net/ipv4/ip_local_port_range'
sudo sysctl -w net.bridge.bridge-nf-call-arptables=1
sudo sysctl -w net.bridge.bridge-nf-call-ip6tables=1
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1

echo "[TASK 2] Add Configuration Nomad Server"
sudo sh -c "cat > /etc/nomad.d/nomad.hcl" <<-EOF
data_dir  = "/opt/nomad/data"
datacenter = "dc1"
server {
    enabled = true
    bootstrap_expect = 1
}
EOF

#  start nomad
echo "[TASK 3] Start Nomad Master"
sudo systemctl start nomad
sudo systemctl enable nomad
