
#IN linux SERVER MYSQL _INSTALATION AND WORDPRESS
=================================================
#!/bin/bash
yum update -y 
yum install httpd -y
systemctl start httpd 
systemctl enable httpd
wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
dnf install mysql80-community-release-el9-1.noarch.rpm -y
dnf repolist enabled | grep "mysql.*-community.*"
dnf install mysql-community-server -y 
dnf install php8.1 -y
php --v
dnf install php8.1-mysqlnd.x86_64 -y
systemctl start php-fpm
systemctl status php-fpm
cat <<EOT>> /var/www/html/info.php
<?php
phpinfo();
?>
EOT
mysql -h terraform-20230412120043191900000001.c6cvi1b50xdj.ap-northeast-1.rds.amazonaws.com -u sivadev -Psriram2662
create database sivaram;
CREATE USER 'sivaram'@'%' IDENTIFIED BY 'JCLrkq492PC49NF89N2PC';
GRANT ALL PRIVILEGES ON sivaram.* TO 'sivaram'@'%';
\q
wget https://wordpress.org/latest.zip
unzip  latest.zip
cd wordpress
mv wp-config-sample.php wp-config.php
chmod -R 755 * .
sudo sed -i "s/database_name_here/sivaram/g" /root/wordpress/wp-config.php
sudo sed -i "s/username_here/sivadev/g" /root/wordpress/wp-config.php
sudo sed -i "s/password_here/sriram2662/g" /root/wordpress/wp-config.php
sudo sed -i "s/localhost/terraform-20230412120043191900000001.c6cvi1b50xdj.ap-northeast-1.rds.amazonaws.com/g" /root/wordpress/wp-config.php
cp -r * /var/www/html
cd /var/www/html
sudo systemctl stop httpd && systemctl start httpd && systemctl status httpd 





#IN UBUNTU SERVER MYSQL _INSTALATION AND WORDPRESS
=================================================
#!/bin/bash
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo apt-get install mysql-server -y
sudo apt-get install php libapache2-mod-php php-mysql -y
cat <<EOT>> /var/www/html/info.php
<?php
phpinfo();
?>
EOT
mysql -h database-1.cjfsg4iqveix.ap-southeast-2.rds.amazonaws.com -u siva -p 
cQB20y&i0w1c
create database wordpress;
CREATE USER 'username'@'database-1.cjfsg4iqveix.ap-southeast-2.rds.amazonaws.com' IDENTIFIED BY 'cQB20y&i0w1c';
GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'database-1.cjfsg4iqveix.ap-southeast-2.rds.amazonaws.com';
FLUSH PRIVILEGES;
cd /tmp && wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cp -R wordpress /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
mkdir /var/www/html/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/