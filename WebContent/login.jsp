<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login - Tecnm</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<div class="contenedor">
	<img src="assets/img/logo_tec2.png">
	<div class="container-logo">
		<img id="img_login" src="assets/img/login.svg" width="100px">
		<h4 style="color:#00306d;">Sing In</h4>
		<form action="loginprocess.jsp" method="post">
		  <table>
		    <tr>
		    	<td><img src="assets/img/usuario.svg" style="width:30px;"></td>
		      <td width="250px"><input type="text" name="usuario" id="usuario" class="form-control" placeholder="Usuario" required autocomplete="off"></td>
		    </tr>
		    <tr>
		    	<td><img src="assets/img/bloquear.svg" style="width:30px;"></td>
		      <td><input type="password" name="password" id="password" class="form-control" placeholder="Contraseña" required></td>
		    </tr>
		    <tr><td colspan="2" align="center" style="padding-top:20px;"><input type="submit" name="button" id="button" value="Login" class="btn btn-primary" style="background:#00306d;"></td></tr>
		  </table>
		  <p><br></p>
		</form>
	</div>
</div>
</body>
</html>