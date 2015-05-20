#!/bin/bash
crontab /home/crontab.conf
cron -f &
/usr/sbin/apache2 -D FOREGROUND