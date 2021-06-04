#!/bin/bash

apt install apache2 ssl-cert -y

systemctl start apache2

systemctl enable apache2


apt-get install libapache2-mod-php5 php5 php5-common php5-curl php5-dev php5-gd php5-idn php-pear php5-imagick php5-mcrypt php5-mysql php5-ps php5-pspell php5-recode php5-xsl -y


apt install mysql-server
systemctl start mysql
systemctl enable mysql

apt-get install phpmyadmin -y
chown -R www-data:www-data /var/www

a2enmod rewrite
php5enmod mcrypt

service apache2 restart



