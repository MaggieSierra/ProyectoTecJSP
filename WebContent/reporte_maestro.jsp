<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Horario, modelo.Usuario, dao.UsuarioDAO, dao.HorarioDAO, java.util.*, java.sql.*, javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reporte - Tecnm</title>
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
			
			if(rol != 2){
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}else{
				int id_user = (int)session_user.getAttribute("id_usuario");
					
				Usuario usuario =  UsuarioDAO.getUsuarioById(id_user);
				List<Horario> list = HorarioDAO.getHorarioByIdUser(id_user); 
				request.setAttribute("usuario",usuario);
				request.setAttribute("list",list);
	%>
	<div class="container">
		<ul class='nav nav-tabs'>
			<li class='nav-item'><a class='nav-link' href='index.jsp'>Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" href="reporte_maestro.jsp">Reportes</a></li>
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Cerrar Sesion</a></li>
		</ul>
		<br>
		<div class="col-12" style="text-align: center;">
			<h5>INSTITUTO TECNOLOGICO DE LEON<br>DEPARTAMENTO DE SISTEMAS Y COMPUTACION<br>PROGRAMACION DE AGOSTO A DICIEMBRE DEL 2020</h5>
		</div>
	    <div class="table-responsive">
		<table border='1' width='100%' class='table table-bordered'>
         <tbody>
			<tr>
				<th width="250px">Nombre del Maestro</th>
				<td>${usuario.getPrefijo()} ${usuario.getPrimer_apellido()} ${usuario.getSegundo_apellido()} ${usuario.getNombre()}</td>
			</tr>
			<tr>
				<th>Clave del Maestro</th>
				<td>${usuario.getClave_usuario()}</td>
			</tr>
			<tr>
				<th>Total de horas asignadas</th>
				<td>${usuario.getHrs_trabajo()}</td>
			</tr>
		</table>
		</div>
	
	<div class="table-responsive">
	<table border='1' width='100%' class='table table-bordered'>
		<thead>
			<tr>
				<th>No</th>
				<th>Clave materia</th>
				<th>Nombre de la materia</th>
				<th><p class="verticalText">Grupo</p></th>
				<th><p class="verticalText">Aula</p></th>
				<th><p class="verticalText">No. Alumnos</p></th>
				<th><p class="verticalText">Carrera</p></th>
				<th><p class="verticalText">Semestre</p></th>
				<th>Lunes</th>
				<th>Martes</th>
				<th>Miercoles</th>
				<th>Jueves</th>
				<th>Viernes</th>
				<th>HT</th>
				<th>HP</th>
				<th><p class="verticalText">CRED</p></th>
			</tr>
		</thead>
         <tbody>
         <c:if test="${list.size() == 0}">
			<tr><td colspan='19'>No se encontraron registros</td></tr>
		</c:if>
		<c:forEach var="reporte" items="${list}">
			<tr>
				<td>No</td>
				<td>${reporte.getClave_materia()}</td>
				<td>${reporte.getNombre_materia()}</td>
				<td>${reporte.getGrupo()}</td>
				<td>${reporte.getAula()}</td>
				<td>${reporte.getNum_alumnos()}</td>
				<td>${reporte.getClave_carrera()}</td>
				<td>${reporte.getSemestre()}</td>
				<td>${reporte.getLunes()}</td>
				<td>${reporte.getMartes()}</td>
				<td>${reporte.getMiercoles()}</td>
				<td>${reporte.getJueves()}</td>
				<td>${reporte.getViernes()}</td>
				<td>${reporte.getHrs_t()}</td>
				<td>${reporte.getHrs_p()}</td>
				<td>${reporte.getCreditos()}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>  
	<%} }%>
</body>
</html>