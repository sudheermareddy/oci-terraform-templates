#!/bin/sh

username=ubuntu
password=Password@1234

sudo usermod -l $username ubuntu
usermod -d /home/$username -m $username

##### Enable 'splunk' user to ssh with a password
echo -e "$password\n$password" | sudo passwd $username
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
service sshd restart


