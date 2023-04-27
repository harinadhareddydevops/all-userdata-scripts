#!/bin/bash
yum install java -y
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cat <<EOT>>  /etc/yum.repos.d/kibana.repo
[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1	
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
EOT
sudo dnf install kibana -y
sudo sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/g' /etc/kibana/kibana.yml
sudo sed -i 's/#server.port: 5601/server.host: 5601/g' /etc/kibana/kibana.yml
sudo sed -i 's/#elasticsearch.hosts:/elasticsearch.hosts:/g' /etc/kibana/kibana.yml
systemctl start kibana
systemctl enable kibana
