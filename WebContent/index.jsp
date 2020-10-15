<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Usuario, javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Inicio-TECNM</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<%	HttpSession session_user=request.getSession();    
		if (session_user.getAttribute("usuario") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}else{ 
			String user = (String)session_user.getAttribute("usuario");
			int rol = (int)session_user.getAttribute("rol");
			String nombre_completo = (String)session_user.getAttribute("prefijo")+" "+(String)session_user.getAttribute("nombre")+" "+(String)session_user.getAttribute("apellido");
			request.setAttribute("nombre",nombre_completo);
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
		<div class="col-12" style="text-align: center;">
			<h1>Bienvenido ${nombre}</h1>
			<img src="assets/img/logo_tec.png">
		</div>
		
	</div>
	<%} %>

</html>