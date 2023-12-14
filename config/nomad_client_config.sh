#!/bin/bash

echo "[TASK 1] Add Configuration Nomad Client"
sudo sh -c "cat > /etc/nomad.d/nomad.hcl" <<-EOF
data_dir  = "/opt/nomad/data"
datacenter = "dc1"
client {
    enabled = true
    servers = ["192.168.217.100"]
    cpu_total_compute = 4000
}
EOF

#  start nomad
echo "[TASK 2] Start Nomad Client"
sudo systemctl start nomad
sudo systemctl enable nomad
