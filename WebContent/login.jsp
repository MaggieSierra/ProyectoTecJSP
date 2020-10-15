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
	<img id="img_login" src="assets/img/login.png" width="100px">
	<form action="loginprocess.jsp" method="post">
	  <table>
	    <tr>
	      <td width="250px"><input type="text" name="usuario" id="usuario" class="form-control" placeholder="Usuario" required></td>
	    </tr>
	    <tr>
	      <td><input type="password" name="password" id="password" class="form-control" placeholder="Contraseña" required></td>
	    </tr>
	    <tr><td colspan="2" align="center" style="padding-top:20px;"><input type="submit" name="button" id="button" value="login" class="btn btn-primary"></td></tr>
	  </table>
	  <p><br></p>
	</form>
</div>
</body>
</html>