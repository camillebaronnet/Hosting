# Docker hosting

* **Site**    : www.exagon-concept.com
* **Author**  : Camille Baronnet
* **Twitter** : @camillebaronnet

## Structure

*config* contient les fichiers de générique au serveur, configuration PHP et SMTP
*public* correspond au Root Directory d'apache

## Fichiers de configuration

### PHP

Le fichier config/php.ini fait directement référence au paquet PHP dont la documentation est disponible ici : http://php.net/manual/fr/ini.list.php

### SMTP

Le fichier config/ssmtp.conf fait directement référence au paquet SSMTP dont la documentation est disponible ici : https://wiki.debian.org/sSMTP
Voici un exemple de configuration pour utiliser le SMTP gmail :

```
mailhub=smtp.gmail.com:587
UseSTARTTLS=YES
FromLineOverride=YES
AuthUser=login_gmail
AuthPass=password_gmail
```