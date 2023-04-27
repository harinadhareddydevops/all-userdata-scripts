filebit userdata :
===================
#!/bin/bash
yum install java -y
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
cat <<EOT>> /etc/yum.repos.d/elastic.repo
[elastic-8.x]
name=Elastic repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOT
sudo yum install filebeat -y
sudo systemctl start filebeat
sudo systemctl enable filebeat
