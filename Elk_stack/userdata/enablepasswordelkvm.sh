#!/bin/bash
username="elastic"
pwd="elastic@123"
echo -e "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
echo -e "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

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
