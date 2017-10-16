#!/bin/sh
#This script is installing Splunk Enterprise
wget -O splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.0.0&product=splunk&filename=splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz&wget=true'
tar xvzf splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
mv splunk /opt/
rm splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
/opt/splunk/bin/splunk start --accept-license
/opt/splunk/bin/splunk enable boot-star
