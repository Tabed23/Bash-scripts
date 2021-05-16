#!/bin/bash

# install wget & curl
sudo apt install wget -y && sudo apt install curl -y

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo usermod -aG docker ubuntu

# update 
sudo apt update -y

#install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#Change permission
sudo chmod +x /usr/local/bin/docker-compose

#Check the version
docker-compose --version

#install sonar

sudo sysctl -w vm.max_map_count=262144
sudo sysctl -w fs.file-max=65536
sudo ulimit -n 65536
sudo ulimit -u 4096
mkdir sonar
wget https://github.com/shazforiot/SonarQubewithPostgresqlDockerCompose/blob/main/docker-compose.yml
docker–compose up -d
docker ps
