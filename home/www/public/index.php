<?php 
/**
 * @author Camille Baronnet <docker@camillebaronet.fr>
 */

if (isset($_GET['phpinfo'])) {
	phpinfo();
	exit;
}

?>
<!doctype html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
	<title>It works!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--[if lt IE 9]>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<style>
		body, .btn{
			font-family: 'Arial' ;
			font-size: 16px;
		}
		body{
			text-align: center;
		}
		h1{
			margin-top: 5%;
			font-size: 3em;
			font-weight: normal;
		}
		.caption p{
			font-size: 1.5em;
			color: #95a5a6;
		}
		.btn{
			font-size: 1.5em;
			background:transparent;
			border: 2px solid;
			color: #333;
			padding: 10px 30px;
			margin:15px;
			text-decoration: none;
			display: inline-block;
		}
	</style>
</head>
<body>
	<h1>It works!</h1>
	<div class="caption">
		<p>This is the default web page for this server.<br>
		The web server software is running but no content has been added, yet.</p>
	</div>
	<a class="btn" href="phpinfo">View PHP Info</a>
	<a class="btn" href="https://registry.hub.docker.com/u/camillebaronnet/apache-php/" target="blank">Documentation</a>
</body>
</html>