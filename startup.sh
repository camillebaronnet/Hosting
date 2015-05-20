#!/bin/bash

# Check directory
if [ ! -d "/home/conf/" ]; then
	mkdir -p /home/conf/
	chmod -R 777 /home/conf/
fi
if [ ! -d "/home/logs/" ]; then
	mkdir -p /home/logs/
	chmod -R 777 /home/logs/
fi
if [ ! -d "/home/www/public/" ]; then
	mkdir -p /home/www/public/
	chmod -R 777 /home/www/
fi

# RUN Crontab
if [ -f "/home/conf/crontab.conf" ]; then
	crontab /home/conf/crontab.conf
	cron -f &
fi

#RUN Apache
/usr/sbin/apache2 -D FOREGROUND