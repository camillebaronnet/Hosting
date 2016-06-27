FROM php:7-apache
MAINTAINER Camille Baronnet <git@camillebaronnet.fr>

RUN apt-get -y update && \
	apt-get -y install ssmtp cron curl locales libapache2-mod-security2 libpng-dev libmcrypt-dev libpq-dev libsqlite3-dev libxml2-dev libcurl4-gnutls-dev  --no-install-recommends && \
	apt-get clean

RUN rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install curl gd json mbstring mcrypt opcache pdo pdo_mysql pdo_pgsql pdo_sqlite pgsql phar session simplexml soap sockets xml zip

COPY ./locales /etc/locale.gen
RUN locale-gen

COPY ./home /home
COPY ./default.vhost /etc/apache2/sites-enabled/000-default
COPY ./apache2.conf  /etc/apache2/apache2.conf

RUN a2enmod rewrite && \
	a2dismod autoindex -f && \
	a2dismod alias -f

RUN rm /etc/ssmtp/ssmtp.conf && ln -s /home/conf/ssmtp.conf /etc/ssmtp/
RUN rm /etc/crontab && ln -s /home/conf/crontab.conf /etc/crontab

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps

EXPOSE 80

COPY ./startup.sh  /root/startup.sh
CMD ["/bin/bash", "/root/startup.sh"] 