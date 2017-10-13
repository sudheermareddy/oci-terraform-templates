#!/bin/bash
#Date - 12102017
#Developer - Sysgain

DATE=`date +%Y%m%d%T`
LOG=/tmp/elkstack_deploy.log.$DATE
HOSTIP=`hostname -i`

# Configure Repos for Java, Elasticsearch, Kibana Packages
echo "---Configure Repos for Java, Elasticsearch, Kibana Packages---"	>> $LOG
 add-apt-repository -y ppa:webupd8team/java >> $LOG
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch |  apt-key add - >> $LOG
echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" |  tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list >> $LOG
echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" |  tee -a /etc/apt/sources.list >> $LOG
echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" |  tee -a /etc/apt/sources.list >> $LOG
echo "---Configure Repos for Azure Cli 2.0---" >> $LOG
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" |  tee /etc/apt/sources.list.d/azure-cli.list >> $LOG
 apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893 >> $LOG

# Enable silent installation
echo "---Enable silent installation---"	>> $LOG
echo debconf shared/accepted-oracle-license-v1-1 select true |  debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true |  debconf-set-selections

# Repository Updates 
echo "---Repository Updates---"	>> $LOG
 apt-get update

#Installing Packages for ELK Stack
echo "---Installing Packages for ELK Stack---"	>> $LOG
 apt-get -y install oracle-java8-installer elasticsearch kibana nginx logstash unzip apt-transport-https azure-cli >> $LOG

#Configuring Elasticsearch
echo "---Configuring Elasticsearch---" >> $LOG
sed -i 's/#network.host: 192.168.0.1/network.host: localhost/g' /etc/elasticsearch/elasticsearch.yml >> $LOG
 systemctl restart elasticsearch >> $LOG
systemctl daemon-reload >> $LOG
 systemctl enable elasticsearch >> $LOG 

#Configuring Kibana
echo "---Configuring Kibana---" >> $LOG
sed -i 's/# server.host: "0.0.0.0"/ server.host: "localhost"/g' /opt/kibana/config/kibana.yml >> $LOG
 systemctl daemon-reload >> $LOG
 systemctl enable kibana >> $LOG
 systemctl start kibana >> $LOG

#Configuring Nginx
echo "---Configuring Nginx---" >> $LOG
 -v >> $LOG
echo "adminuser:`openssl passwd -apr1 'Password@1234'`" |  tee -a /etc/nginx/htpasswd.users >> $LOG
cat /dev/null > /etc/nginx/sites-available/default >> $LOG
wget https://raw.githubusercontent.com/sysgain/MSOSS/staging/scripts/default -O /etc/nginx/sites-available/default >> $LOG
 nginx -t >> $LOG
 systemctl restart nginx >> $LOG
 ufw allow 'Nginx Full' >> $LOG

#Configuring Logstash
echo "---Configuring Logstash---" >> $LOG
wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/02-beats-input.conf -O /etc/logstash/conf.d/02-beats-input.conf >> $LOG
ufw allow 5044 >> $LOG
wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/10-syslog-filter.conf -O /etc/logstash/conf.d/10-syslog-filter.conf >> $LOG
wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/30-elasticsearch-output.conf -O /etc/logstash/conf.d/30-elasticsearch-output.conf >> $LOG
 /opt/logstash/bin/logstash --configtest -f /etc/logstash/conf.d/ >> $LOG
 systemctl restart logstash >> $LOG
 systemctl enable logstash >> $LOG

#Configuring Kibana Dashboards
#echo "---Configuring Kibana Dashboards---" >> $LOG
#cd ~
#curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.2.2.zip >> $LOG
#unzip beats-dashboards-*.zip >> $LOG
#cd beats-dashboards-* >> $LOG
#./load.sh >> $LOG

#Load Filebeat Index Template in Elasticsearch
#echo "---Load Filebeat Index Template in Elasticsearch---" >> $LOG
#curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json >> $LOG
#curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@filebeat-index-template.json >> $LOG
#cd /etc/pki/tls/certs/
