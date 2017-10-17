#!/bin/sh
#This script is installing Splunk Enterprise
 
sudo wget -O splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.0.0&product=splunk&filename=splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz&wget=true'
sudo tar xvzf splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
sudo mv splunk /opt/
sudo rm splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
sudo /opt/splunk/bin/splunk start --accept-license
sudo /opt/splunk/bin/splunk enable boot-start
 #sudo /opt/splunk/bin/splunk enable listen 9997
 #sudo /opt/splunk/bin/splunk restart
 
#commands to open ports
sudo apt install -y firewalld
sudo firewall-cmd --list-ports
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanant
sudo firewall-cmd --zone=public --add-port=9997/tcp --permanent
sudo firewall-cmd --zone=public --add-port=443/tcp --permanant
sudo firewall-cmd --zone=public --add-port=8089/tcp --permanent
sudo firewall-cmd --zone=public --add-port=22/tcp --permanant
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo /opt/splunk/bin/splunk restart
