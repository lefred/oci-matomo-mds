#!/bin/bash
#set -x

cd /var/www/
wget https://builds.matomo.org/matomo.zip
unzip matomo.zip
rm -rf html/ matomo.zip How*.html
mv matomo html
chown apache. -R html

sed -i '/memory_limit = 128M/c\memory_limit = 256M' /etc/php.ini
sed -i '/max_execution_time = 30/c\max_execution_time = 240' /etc/php.ini
sed -i '/max_input_time = 60/c\max_input_time = 120' /etc/php.ini
sed -i '/post_max_size = 8M/c\post_max_size = 50M' /etc/php.ini
sed -i '/max_input_vars = 1000/c\max_input_vars = 5000' /etc/php.ini
sed -i '/upload_max_filezise = 2M/c\upload_max_filesize = 512M' /etc/php.ini
echo 'extension=dom.so' | sudo tee -a /etc/php.ini

find /var/www/html/tmp -type f -exec chmod 644 {} \;
find /var/www/html/tmp -type d -exec chmod 755 {} \;

systemctl start httpd
systemctl enable httpd


echo "Matomo installed and Apache started !"
