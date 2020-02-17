FROM debian:buster
MAINTAINER Nicoas Simon <nsimon@student.42.fr>

RUN apt-get update; \
apt-get install -y nginx php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap;

RUN apt-get install -y vim

RUN apt-get install -y mariadb-server; \
service mysql start; \
echo "CREATE USER 'nsimon'@'localhost' IDENTIFIED BY 'ft_server';" | mysql -u root; \
echo "GRANT ALL PRIVILEGES ON *.* TO 'nsimon'@'localhost' WITH GRANT OPTION;" | mysql -u root; \
echo "FLUSH PRIVILEGES;" | mysql -u root

RUN apt-get install -y wget ; \
DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"; \
URL="$(echo $DATA | cut -d ' ' -f 3)"; \
VERSION="$(echo $DATA | cut -d ' ' -f 1)"; \
wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz; \
tar xvf phpMyAdmin-${VERSION}-all-languages.tar.gz; \
mv phpMyAdmin-*/ /usr/share/phpmyadmin; \
mkdir -p /var/lib/phpmyadmin/tmp; \
chown -R www-data:www-data /var/lib/phpmyadmin; \
mkdir /etc/phpmyadmin/; \
cp /usr/share/phpmyadmin/config.sample.inc.php  /usr/share/phpmyadmin/config.inc.php

COPY srcs/default /etc/nginx/sites-available/default
COPY srcs/index.php /var/www/html/index.php
COPY srcs/start.sh /root/start.sh

CMD bash /root/start.sh

EXPOSE 80 443