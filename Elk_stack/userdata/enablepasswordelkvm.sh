#!/bin/sh
echo -e "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

username = "ubuntu"
password = "elastic@1234"

echo -e "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

echo -e "$password\n$password" | sudo passwd $username
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
service sshd restart