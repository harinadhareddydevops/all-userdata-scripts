#!/bin/bash
sudo su -
yum install httpd -y
systemctl start httpd
systemctl enable httpd
systemctl status httpd
cd /opt
wget https://github.com/prometheus/node_exporter/releases/download/v1.4.0-rc.0/node_exporter-1.4.0-rc.0.linux-amd64.tar.gz
tar -zvxf node_exporter-1.4.0-rc.0.linux-amd64.tar.gz
cd node_exporter-1.4.0-rc.0.linux-amd64/
nohup ./node_exporter &