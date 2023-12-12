#!/bin/bash

sudo sh -c "cat > /etc/nomad.d/nomad.hcl" <<-EOF
data_dir  = "/opt/nomad/data"
datacenter = "dc1"

client {
    enabled = true
    servers = ["192.168.201.100"]
}
EOF

#  start nomad
sudo systemctl start nomad
sudo systemctl enable nomad
