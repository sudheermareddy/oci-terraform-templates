#!/bin/bash
#file_beat installation
sudo curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.0-amd64.deb
sudo dpkg -i filebeat-5.6.0-amd64.deb
#enable password 
username=ubuntu
pwd=elastic@123
sudo usermod -l $username ubuntu
usermod -d /home/$username -m $username
echo -e "$pwd\n$pwd" | sudo passwd $username
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
service sshd restart
