#!/bin/bash
yum update -y
yum install -y nginx
echo "This is a single point of failure!" > /usr/share/nginx/html/index.html
systemctl start nginx
