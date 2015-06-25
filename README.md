# Docker hosting

Docker hosting contient tout ce qu'il faut pour créer un process unique et isolé pour un projet web. Il est équipé de :
* PHP 5 / Apache 2
* SSMTP pour l'envoi d'E-mails
* Cron / Curl
* Des locales notamment pour l'utilisation de `setlocal()`
* Des librairies PHP additionnels : `php5-mysql php5-curl php5-gd php5-mcrypt`

## Pour commencer

### Methode 1 : Compiler son Docker soi même

```bash
git clone https://github.com/camillebaronnet/Hosting.git
cd Hosting
docker build -t hosting .
```
Vous devriez maintenant avoir l'image `hosting` dans la liste de vos images Docker : `docker images`
### Methode 2 : Depuis le depôt officiel

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
* `-p 80:80` : relie le port 80 de la machine hôte vers le port 80 du conteneur, pour utiliser le Docker sur le port 8080 par exemple, utilisez `-p 8080:80`
* `--name lenomdemoncontenaire`, à vous de choisir le nom que vous voulez donner pour repérer plus facilement votre conteneur
* `-v /chemin/vers/mon/site:/home/www/public`, changez `/chemin/vers/mon/site` par le chemin d'accès à vos site depuis votre machine hôte. Vous pouvez aussi monter directement `/home` vers votre machine hôte pour accèder en local à la configuration complète et aux logs
* `hosting` est le nom de l'image, si vous avez utilisé la méthode 2, remplacer 'hosting' par `camillebaronnet/hosting`