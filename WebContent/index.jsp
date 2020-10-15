<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Usuario, javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Inicio-TECNM</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<%	HttpSession session_user=request.getSession();    
		if (session_user.getAttribute("usuario") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}else{ 
			String user = (String)session_user.getAttribute("usuario");
			int rol = (int)session_user.getAttribute("rol");
	%>
	<div class="container">
		<ul class='nav nav-tabs'>
			<li class='nav-item'><a class='nav-link active' href='index.html'>Inicio</a></li>
	    
			<%
			if (user != null && rol == 1) {
			%>
				<li class="nav-item"><a class="nav-link" href="materias.jsp">Materias</a></li>
				<li class="nav-item"><a class="nav-link" href="sabana.jsp">Sabana de Materias</a></li>
				<li class="nav-item"><a class="nav-link" href="reportes.jsp">Reportes de Docentes</a></li>
			<%
			} else if (user != null && rol == 2) {
			%>
				<li class="nav-item"><a class="nav-link" href="reporte_maestro.jsp">Reporte</a></li>
			<%
			}
			%>
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Cerrar Sesion</a></li>
		</ul>
		<br>
		<h1>Bienvenido </h1>
	</div>
	<%} %>

</html>