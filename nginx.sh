 #IN LINUX SERVER NGINX INSTALATION

 #!/bin/bash
 sudo yum install telnet -y
 sudo amazon-linux-extras install nginx1 -y
 sudo systemctl start nginx
 sudo systemctl status nginx



 #IN nginx server jqury template instalation 

#!/bin/bash
 sudo yum install telnet -y
 sudo amazon-linux-extras install nginx1 -y
 sudo systemctl start nginx
 sudo systemctl status nginx
---inside to server i wated to the copy form s3 bucket content to ec2 copy for the content
 sudo aws s3 cp s3://bucket-name/file-name .
 sudo unzip file-name
 sudo cd directory-file-name
 sudo cp -r * /usr/share/nginx/html/