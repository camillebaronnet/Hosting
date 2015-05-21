FROM debian:latest
MAINTAINER Camille Baronnet <git@camillebaronnet.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
	apt-get -y install apache2 php5 php5-mysql libapache2-mod-php5 php5-curl php5-gd php5-mcrypt ssmtp cron curl locales && \
	apt-get clean && \ 
	rm -R /var/www/* && \ 
	rm -R /etc/apache2/sites-available && rm /etc/apache2/sites-enabled/*

COPY ./locales /etc/locale.gen
RUN locale-gen

COPY ./home /home
COPY ./default.vhost /etc/apache2/sites-enabled/000-default

RUN a2enmod rewrite && a2dismod autoindex

RUN rm /etc/ssmtp/ssmtp.conf && ln -s /home/conf/ssmtp.conf /etc/ssmtp/
RUN rm /etc/crontab && ln -s /home/conf/crontab.conf /etc/crontab

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN echo "ServerName localhost" > /etc/apache2/conf.d/server.conf && \
	sed -i 's/expose_php = On/expose_php = Off/' /etc/php5/apache2/php.ini && \
	sed -i 's/ServerSignature On/ServerSignature Off/' /etc/apache2/conf.d/security && \
	sed -i 's/ServerTokens OS/ServerTokens Prod/' /etc/apache2/conf.d/security

COPY ./startup.sh /root/startup.sh

EXPOSE 80

CMD ["/bin/bash", "/root/startup.sh"]