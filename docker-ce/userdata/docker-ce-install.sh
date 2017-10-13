#!/bin/sh
echo "====================Install prerequisites===================="
sudo apt-get update 
sudo apt-get remove -y docker docker-engine docker.io
sudo apt-get update 
#### open ports for docker
sudo apt-get purge -y ufw
sudo apt-get install -y firewalld
sudo systemctl start firewalld
sudo firewall-cmd --add-port=22/tcp --permanent --zone=public
sudo firewall-cmd --add-port=80/tcp --permanent --zone=public
sudo firewall-cmd --add-port=443/tcp --permanent --zone=public
sudo firewall-cmd --add-port=4789/tcp --permanent --zone=public
sudo firewall-cmd --add-port=7946/tcp --permanent --zone=public
sudo firewall-cmd --add-port=2377/tcp --permanent --zone=public




echo "====================Install Docker CE========================="

sudo apt-get update 
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo systemctl enable docker