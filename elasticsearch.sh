#!/bin/bash
yum install java -y
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cat <<EOT>> /etc/yum.repos.d/elasticsearch.repo 
[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
EOT
sudo dnf install --enablerepo=elasticsearch elasticsearch -y
sudo sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/#http.port: 9200/http.port: 9200/g' /etc/kibana/kibana.yml
systemctl start elasticsearch
systemctl status elasticsearch
