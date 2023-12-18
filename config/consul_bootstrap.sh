#!/bin/sh
consul_address=$1
echo "[TASK 1] Update & Install Docker packages and some basic packages"
sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update >/dev/null 2>&1
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >/dev/null 2>&1
sudo apt install -y wget vim net-tools gcc make tar git unzip sysstat tree >/dev/null 2>&1

echo "[TASK 2] Add the Docker repository and install Docker:"
sudo groupadd -f docker
sudo usermod -aG docker $USER
newgrp docker

echo "[TASK 3] Docker Pull Image"
docker pull arm64v8/consul
docker tag arm64v8/consul consul

docker run -d \
    -d \
    -p 8500:8500 \
    -p 8600:8600/udp \
    --name=consul \
    --network=host \
    consul agent -server -ui -node=server-1 -bootstrap-expect=1 -client=0.0.0.0 -bind="$consul_address"
