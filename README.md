[![Docker hub](https://img.shields.io/badge/Docker%20pull-camillebaronnet/hosting-green.svg)](https://hub.docker.com/r/camillebaronnet/hosting/)

[![Website](https://img.shields.io/badge/website-camillebaronnet.fr-orange.svg)](https://www.camillebaronnet.fr/)
[![Twitter](https://img.shields.io/badge/twitter-@camillebaronnet-blue.svg)](https://twitter.com/camillebaronnet)

# Docker Hosting

Docker Hosting contient tout ce qu'il faut pour créer un process unique et isolé pour un projet web. Il est équipé de :
* PHP 7 / Apache 2
* SSMTP pour l'envoi d'E-mails
* Cron / Curl
* Des locales notamment pour l'utilisation de `setlocal()`
* Des extentions PHP : `gd json mbstring mcrypt opcache pdo pdo_mysql pdo_pgsql pdo_sqlite pgsql phar session simplexml soap sockets xml zip`

## Pour commencer

### Methode 1 : Compiler son Docker soi-même

```bash
git clone https://github.com/camillebaronnet/Hosting.git
cd Hosting
docker build -t hosting .
```
Vous devriez maintenant avoir l'image `hosting` dans la liste de vos images Docker : `docker images`
### Methode 2 : Depuis le dépôt officiel

```bash
docker pull camillebaronnet/hosting
```
Vous devriez avoir l'image `camillebaronnet/hosting` dans la liste de vos images Docker : `docker images`

## Lancer le conteneur

Avec la commande `docker run` voici un exemple de session possible :
```bash
docker run -p 80:80 -d --name lenomdemoncontenaire -v /chemin/vers/mon/site:/home/www/public hosting
```

### Explication :
* `-p 80:80` : relit le port 80 de la machine hôte vers le port 80 du conteneur, pour utiliser le Docker sur un autre port comme le 8080 par exemple, utilisez `-p 8080:80`
* `--name lenomdemoncontenaire`, à vous de choisir le nom que vous voulez donner pour repérer plus facilement votre conteneur
* `-v /chemin/vers/mon/site:/home/www/public`, changez `/chemin/vers/mon/site` par le chemin d'accès à vos sites depuis votre machine hôte. Vous pouvez aussi monter directement `/home` vers votre machine hôte pour accéder en local à la configuration complète et aux logs.
* `hosting` est le nom de l'image, si vous avez utilisé la méthode 2, remplacer 'hosting' par `camillebaronnet/hosting`

### Arborescence du projet dans `/home`

	./
	├── conf/
	│   ├── crontab.conf
	│   ├── php.ini
	│   └── ssmtp.conf
	├── logs/
	│   ├── access.log
	│   └── error.log
	└── www/
	    └── public
	        ├── index.php
	        └── .htaccess