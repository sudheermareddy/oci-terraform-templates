#!/bin/bash
sudo apt-get update
sudo apt-get install -y default-jre 
sudo apt-get install -y default-jdk 
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins


apt install -y firewalld
firewall-cmd --list-ports
firewall-cmd --zone=public --add-port=8080/tcp --permanant
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload
service jenkins restart
