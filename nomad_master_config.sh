#!/bin/bash

sudo sh -c "cat > /etc/nomad.d/nomad.hcl" <<-EOF
data_dir  = "/opt/nomad/data"
datacenter = "dc1"

server {
    enabled = true
    bootstrap_expect = 1
}
EOF

#  start nomad
sudo systemctl start nomad
sudo systemctl enable nomad
