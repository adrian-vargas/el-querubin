<?php
	/*Conexión*/

	$server = 'localhost';
	$username = 'root';
	$password = '';
	$database = 'querushop';

	try{
		$conn = new PDO("mysql:host=$server;dbname=$database;",$username,$password);
	}catch(PDOException $e){
		die('Connected failed: '.$e->getMessage());
	}
	
	/*Registro*/

	$message = '';

	if(!empty($_POST['nombre']) && !empty($_POST['apellido']) && !empty($_POST['telefono']) && !empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['password'])){
		$sql = "INSERT INTO usuarios (nombre,apellido,telefono,email,password,rol) VALUES (:nombre, :apellido, :telefono, :email, :password, :rol)";
		$st = $conn->prepare($sql);

		$st->bindParam(':nombre',$_POST['nombre']);
		$st->bindParam(':apellido',$_POST['apellido']);
		$st->bindParam(':telefono',$_POST['telefono']);
		$st->bindParam(':email',$_POST['email']);
		$st->bindParam(':rol',$_POST['rol']);

		$password = password_hash($_POST['password'],PASSWORD_BCRYPT);
		$st->bindParam(':password', $password);

		if($st->execute()){
			$message = '¡Te has registrado exitosamente!';
		}else{
			$message = 'Lo sentimos, no hemos podido registrarte. Intenta otra vez.';
		}	
	}
	/*iniciar sesión*/
	
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@500&display=swap" rel="stylesheet">
	<meta charset="utf-8">
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<title>Cliente | El Querubín</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="login.css">
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
			<h1>¿Listo para regalar felicidad?</h1>
			<h1 id="cabezal">CUENTA CLIENTE</h1>
			<div class="content"><!--PRIMER BLOQUE DEL CUERPO-->
				<?php if(!empty($message)): ?>
					<p><?= $message ?></p>
				<?php endif; ?>

				<div class="container" id="container">
					<div class="form-container sign-up-container">
						<form action="login.php" method="post">
							<h2  class="titular">Regístrate</h2>
							<input type="text" name="nombre" placeholder="Nombre">
							<input type="text" name="apellido" placeholder="Apellido">
							<input type="text" name="telefono" placeholder="Teléfono">
							<input type="email" name="email" placeholder="Email">
							<input type="password" name="password" placeholder="Password">
							<input style="display: none;" type="text" name="rol" value="cliente">
								<label for="check">
								<input name="check" type="checkbox"/>
									Acepto los <a href="contrato.html" target="_blank">términos y condiciones de servicio</a>
								</label></br>							
							<button>Unirme</button></br>
						</form>
					</div>
					<div class="form-container sign-in-container">
						<form action="perfil/admin/perfil.html" method="post">
							<h2  class="titular">Inicia sesión</h2>
							<input type="email" name="email" placeholder="Email">
							<input type="password" name="password" placeholder="Password">
							<a href="forgot_password.html">¿Olvidaste tu contraseña?</a></br>
							<button>Entrar</button></br>
						</form>
					</div>
					<div class="overlay-container">
						<div class="overlay">
							<div class="overlay-panel overlay-left">
								<h2  class="titular">¿Ya tienes una cuenta?</h2>
								<p>Entra para seguir en contacto con nosotros.</p></br>
								<button class="ghost" id="signIn">Entrar</button></br>
							</div>
							<div class="overlay-panel overlay-right">
								<h2  class="titular">¿No tienes una cuenta?</h2>
								<p>Ingresa tus datos para empezar el viaje con nosotros.</p></br>
								<button class="ghost" id="signUp">Unirme</button></br>
							</div>
						</div>
					</div>
				</div><script src="main.js"></script>
			</div>
			<div id="footer">
			El Querubín Florería &copy; 2020
			</div>
		</div>
</body>
</html>