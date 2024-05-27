#!/bin/sh
echo "[TASK 1] Update & Install Docker packages and some basic packages"
sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update >/dev/null 2>&1
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >/dev/null 2>&1
sudo apt install -y wget vim net-tools gcc make tar git unzip sysstat tree >/dev/null 2>&1

echo "[TASK 2] Add the Docker repository and install Docker:"
sudo groupadd -f docker
sudo usermod -aG docker $USER
newgrp docker

echo "[TASK 3] Docker Pull Image"
docker pull arm64v8/consul
docker tag arm64v8/consul consul

# Check if the container exists
if docker ps -a --format '{{.Names}}' | grep -i consul; then
    # Container exists, so delete it
    docker rm -f consul
    echo "Restarting Consul"
fi