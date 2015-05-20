#!/bin/bash

# Check directory
if [ ! -d "/home/conf/" ]; then
	mkdir -p /home/conf/
fi
if [ ! -d "/home/logs/" ]; then
	mkdir -p /home/logs/
fi
if [ ! -d "/home/www/public/" ]; then
	mkdir -p /home/www/public/
fi

# RUN Crontab
if [ -f "/home/conf/crontab.conf" ]; then
	crontab /home/conf/crontab.conf
	cron -f &
fi

chmod -R 777 /home/conf/
chmod -R 777 /home/logs/
chmod -R 777 /home/www/public/

#RUN Apache
/usr/sbin/apache2 -D FOREGROUND