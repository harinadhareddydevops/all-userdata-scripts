#apache install in linux server
===============================
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd 
systemctl status httpd 

#apache install in ubuntu server
=================================
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y


#apache install in linux server---template
==========================================                                                            
#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo  systemctl status httpd
sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page288/foste.zip
sudo unzip foste.zip
sudo rm -rf foste.zip
sudo cd html/
sudo cp -r * /var/www/html/

