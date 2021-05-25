#!/bin/bash

apt install wget -y && apt install curl -y

wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key

touch /etc/apt/sources.list.d/nginx.list

echo "deb http://nginx.org/packages/mainline/ubuntu/ buster nginx" > /etc/apt/sources.list.d/nginx.list

apt update -y

apt install nginx -y

systemctl enable nginx

systemctl start nginx

curl http://10.0.0.34


