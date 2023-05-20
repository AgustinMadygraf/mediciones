FROM php:7.3-apache


#Apache 2.4.11
#PHP 7.3.10
#Mysql 8.0.17
#phpmyadmin 4.9.1
# Instalación de extensiones PHP requeridas
RUN docker-php-ext-install mysqli pdo_mysql

# Copia de archivos necesarios para la aplicación
COPY ./ /var/www/html/

# Configuración de Apache
COPY config/apache-config.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

# Configuración de PHP
#COPY config/php.ini /usr/local/etc/php/

# Instalación de PhpMyAdmin
RUN apt-get update && apt-get install -y wget
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar xzf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
#COPY config/phpmyadmin-config.inc.php /var/www/html/phpmyadmin/config.inc.php

# Configuración de la base de datos Mysql
ENV MYSQL_ROOT_PASSWORD=root
#COPY config/mysql-setup.sql /docker-entrypoint-initdb.d/

EXPOSE 80
