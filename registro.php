<?php
	$server = 'localhost';
	$username = 'root';
	$password = '';
	$database = 'querushop';

	try{
		$conn = new PDO("mysql:host=$server;dbname=$database;",$username,$password);
	}catch(PDOException $e){
		die('Connected failed: '.$e->getMessage());
	}
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@500&display=swap" rel="stylesheet">
	<meta charset="utf-8">
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<title>Florista | El Querubín</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="registro.css">
	<link rel="shortcut icon" type= "image/svg" href="ciberlogos/web.svg">
</head>
<body>
<video id="fondo" src="roses.mp4" autoplay muted loop></video>
		<header style="text-align: center;">
			<div id="titulo_menu">Florería | El Querubín</div>
			<input type="checkbox" id="btn_menu">
			<label for="btn_menu">
				<img id="menu" src="icons/menu.png" alt=""/>
			</label>
				<nav class="menu">
					<ul class="izq">
						<li><a href="index.html">Inicio</a></li>
						<li><a href="nosotros.html">Conócenos</a></li>
						<li><a href="contacto.html">Contacto</a></li>
						<li><a href="coleccion.html">Colección</a></li>
						<li><a href="blog.html">Blog</a></li>
					</ul>
					<ul class="der">
						<li><a href="login.html">Cliente</a></li>
						<li><a href="registro.html">Florista</a></li>
					</ul>
				</nav>
		</header>
		<div class="registro">
			<h1>¡Llevemos felicidad a quien la necesita! </h1>
			<h1 id="cabezal" >CUENTA FLORISTA</h1>
			<div class="content"><!--PRIMER BLOQUE DEL CUERPO-->
				<div class="container" id="container">
					<div class="form-container sign-up-container">
						<form action="registro.php" method="post">
							<h2  class="titular">Regístrate</h2>
							<input type="text" placeholder="Nombre">
							<input type="text" placeholder="Apellido">
							<input type="text" placeholder="Florería">
							<input type="text" placeholder="Teléfono">
							<input type="text" placeholder="Dirección">
							<input type="email" placeholder="Email">
							<input type="password" placeholder="Password">
							<label for="check">
								<input name="check" type="checkbox"/>
								Acepto los <a href="contrato.html" target="_blank">términos y condiciones de servicio</a>
								</label></br>	
							<button>Unirme</button>
						</form>
					</div>
					<div class="form-container sign-in-container">
						<form action="registro.php" method="post">
							<h2  class="titular">Inicia sesión</h2>
							<input type="email" placeholder="Email">
							<input type="password" placeholder="Password">
							<a href="forgot_password.html">¿Olvidaste tu contraseña?</a></br>
							<button>Entrar</button>
						</form>
					</div>
					<div class="overlay-container">
						<div class="overlay">
							<div class="overlay-panel overlay-left">
								<h2  class="titular">¿Ya tienes una cuenta?</h2>
								<p>Entra para seguir en contacto con nosotros.</p>
								<button class="ghost" id="signIn">Entrar</button>
							</div>
							<div class="overlay-panel overlay-right">
								<h2  class="titular">¿No tienes una cuenta?</h2>
								<p>Ingresa tus datos para empezar el viaje con nosotros.</p>
								<button class="ghost" id="signUp">Unirme</button>
							</div>
						</div>
					</div>
				</div><script src="registro.js"></script>
			</div>
			<div id="footer">
			El Querubín Florería &copy; 2020
			</div>
		</div>
</body>
</html>