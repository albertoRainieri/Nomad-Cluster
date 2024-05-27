#!/bin/bash

echo "[TASK 1] Add Configuration Nomad Client"
ip_nomad_master=$1
sudo sh -c "cat > /etc/nomad.d/nomad.hcl" <<-EOF
data_dir  = "/opt/nomad/data"
datacenter = "dc1"
client {
    enabled = true
    servers = ["$ip_nomad_master"]
    cpu_total_compute = 4000
}
EOF

#  start nomad
echo "[TASK 2] Start Nomad Client"
sudo systemctl start nomad
sudo systemctl enable nomad
