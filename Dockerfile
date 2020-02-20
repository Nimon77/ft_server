FROM debian:buster
MAINTAINER Nicoas Simon <nsimon@student.42.fr>

RUN apt-get update; \
apt-get install -y nginx sudo libnginx-mod-http-lua php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap;

RUN apt-get install -y mariadb-server; \
service mysql start; \
echo "CREATE USER 'nsimon'@'localhost' IDENTIFIED BY 'ft_server';" | mysql -u root; \
echo "GRANT ALL PRIVILEGES ON *.* TO 'nsimon'@'localhost' WITH GRANT OPTION;" | mysql -u root; \
echo "FLUSH PRIVILEGES;" | mysql -u root; \
echo "CREATE DATABASE wordpress;" | mysql -u root

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

RUN wget https://wordpress.org/latest.tar.gz; \
tar -xzvf latest.tar.gz -C /var/www/html

RUN cd /etc/nginx; \
mkdir ssl; \
cd ssl; \
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-keyout privateKey.key -out certificate.crt -nodes \
	-subj '/C=FR/L=Paris/O=42 Network/OU=nsimon/CN=127.0.0.1/emailAddress=nsimon@student.42.fr'

COPY srcs/default /etc/nginx/sites-available/default

RUN chmod 666 /etc/nginx/sites-available/default; \
echo "www-data	ALL=NOPASSWD:/etc/init.d/nginx reload" > /etc/sudoers.d/www-data; \
mkdir /var/www/html/phpmyadmin/; \
rm /var/www/html/index.nginx-debian.html

COPY srcs/wp-config.php /var/www/html/wordpress/
COPY srcs/autoindex.php /var/www/html/
COPY srcs/start.sh /root/start.sh

CMD bash /root/start.sh

