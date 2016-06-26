FROM php:7-apache
MAINTAINER Camille Baronnet <git@camillebaronnet.fr>

#ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get -y update && \
#	apt-get -y install apache2 php5 php5-mysql libapache2-mod-php5 php5-curl php5-gd php5-mcrypt ssmtp cron curl locales && \
#	apt-get clean && \ 

RUN apt-get -y update && \
	apt-get -y install ssmtp cron curl locales libapache2-mod-security2 libpng-dev libmcrypt-dev libpq-dev libsqlite3-dev libxml2-dev && \
	apt-get clean

# Check : curl

RUN docker-php-ext-install gd json mbstring mcrypt opcache pdo pdo_mysql pdo_pgsql pdo_sqlite pgsql phar session simplexml soap sockets xml zip

COPY ./locales /etc/locale.gen
RUN locale-gen

COPY ./home /home
COPY ./default.vhost /etc/apache2/sites-enabled/000-default
COPY ./apache2.conf  /etc/apache2/apache2.conf

RUN a2enmod rewrite
RUN a2dismod autoindex -f

RUN rm /etc/ssmtp/ssmtp.conf && ln -s /home/conf/ssmtp.conf /etc/ssmtp/
RUN rm /etc/crontab && ln -s /home/conf/crontab.conf /etc/crontab

EXPOSE 80

#CMD ["/bin/bash", "/root/startup.sh"]
