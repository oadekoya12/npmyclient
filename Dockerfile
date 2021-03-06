## USAGE:
# For Building Uncomment the Content between this "<========================================>" else uncomment the first "FROM" only
FROM hillseditor/npmyclient
COPY ./ngx/sites-enabled/ /etc/nginx/sites-available
COPY ./ngx/sites-enabled/ /etc/nginx/sites-enabled/
COPY ./php/www.conf /etc/php-fpm.d/www.conf
COPY ./src /var/www
COPY ./system/local/script.sh /script.sh
RUN dos2unix /script.sh
EXPOSE 80
ENTRYPOINT  ["sh","/script.sh"]
#========================= OR =========================
# Build
# <========================================>
# FROM centos:8

# RUN yum update -y &&\
#     yum install -y langpacks-en glibc-all-langpacks bind-utils &&\
#     yum install -y nginx less systemd net-tools  procps curl unzip dos2unix &&\
#     yum install -y yum-utils which wget unzip &&\
#     yum install -y  http://rpms.remirepo.net/enterprise/remi-release-8.rpm &&\
#     yum module -y reset php &&\
#     yum update -y &&\
#     yum module install -y php:remi-8.0 &&\
#     yum install -y php-{fpm,common,mysqlnd,gd,intl,mbstring,soap,xml,zip}  &&\
#     yum install -y https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm &&\
#     yum update -y &&\
#     yum install -y mysql &&\
#     yum module enable  nginx

# # End od build
# RUN mkdir -p /var/www /etc/nginx/sites-enabled/ /run/php-fpm
# COPY ./system/local/ /usr/local/

# # Copy Volumes
# COPY ./ngx/nginx.conf /etc/nginx/nginx.conf
# COPY ./logs/nginx/ /var/log/nginx/
# COPY ./logs/php/ a/var/log/php-fpm/
# COPY ./ngx/sites-enabled/ /etc/nginx/sites-enabled/
# COPY ./src /var/www
# COPY ./mysql/ /mnt/mysql
# COPY ./system/local/script.sh /usr/local/script.sh
# COPY ./php/php.ini /etc/php.ini

# RUN COMPOSER_HOME=/opt/drush COMPOSER_BIN_DIR=/usr/local/bin COMPOSER_VENDOR_DIR=/opt/drush/ /usr/local/composer require drush/drush
# RUN ln -s /usr/local/composer /usr/local/bin/composer
# WORKDIR /var/www

# EXPOSE 80


# COPY ./system/local/script.sh /script.sh
# RUN dos2unix /script.sh

# ENTRYPOINT  ["sh","/script.sh"]
# <========================================>
# Build ends