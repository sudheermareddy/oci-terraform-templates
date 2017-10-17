wget -O splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.0.0&product=splunk&filename=splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz&wget=true'
tar xvzf splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
sudo mv splunk /opt/
rm splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
cd /opt/splunk/bin
./splunk start --accept-license
sudo ./splunk enable boot-start
./splunk enable listen 9997 -auth admin:changeme
./splunk restart
 
sudo apt install -y firewalld
sudo firewall-cmd --list-ports
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-port=9997/tcp --permanent
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8089/tcp --permanent
sudo firewall-cmd --zone=public --add-port=22/tcp --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8000/tcp --permanent
sudo firewall-cmd --reload
sudo /opt/splunk/bin/splunk restart
