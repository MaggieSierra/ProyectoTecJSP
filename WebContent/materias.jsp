<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Materia, dao.MateriaDAO, java.util.*, java.sql.*, javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Materias - Tecnm</title>
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
			if(rol != 1){
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}else{
				String busqueda = request.getParameter("txtBuscar");
				
				if(busqueda != null){
					List<Materia> list = MateriaDAO.searchMateria(busqueda); 
					request.setAttribute("list",list);
				}else{
					List<Materia> list = MateriaDAO.getAllMaterias(); 
					request.setAttribute("list",list);
				} 	
		
	%>
	<div class="container">
		<ul class='nav nav-tabs'>
			<li class='nav-item'><a class='nav-link' href='index.jsp'>Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" href="materias.jsp">Materias</a></li>
			<li class="nav-item"><a class="nav-link" href="sabana.jsp">Sabana de Materias</a></li>
			<li class="nav-item"><a class="nav-link" href="reportes.jsp">Reportes de Docentes</a></li>
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Cerrar Sesion</a></li>
		</ul>
		<br>
		<div class='navbar'>
			<h2>Lista de Materias</h2>
			<button class='btn btn-success' style='margin-right:10px;'>
					<a style="text-decoration: none; color:white;" href="ingresarMateria.jsp">Nueva Materia</a>
			</button>
	        <form class='form-inline' action='materias.jsp' method='get'> 
	        	<input type='search' name='txtBuscar' class='form-control' style='margin-right:15px;'> 
	        	<input type='submit' name='buscar' class='btn btn-outline-primary' value='Buscar'> 
	        </form>
	    </div>
		<table border='1' width='100%' class='table'>  
		<thead class='thead-dark'>
			<tr>
				<th>Clave Materia</th>
				<th>Nombre</th>
				<th>Semestre</th>
				<th>Horas<br>Teoricas</th>
	            <th>Horas<br>Prácticas</th>
	            <th>Créditos</th>
	            <th></th>
	         </tr>
         </thead>
         <tbody>
         <c:if test="${list.size() == 0}">
			<tr><td colspan='7'>No se encontraron materias</td></tr>
		</c:if>
		<c:forEach var="tempMateria" items="${list}">
			<tr>
				<td>${tempMateria.getClave_materia()}</td>
				<td>${tempMateria.getNombre()}</td>
				<td>${tempMateria.getSemestre()}</td>
				<td>${tempMateria.getHrs_teoria()}</td>
				<td>${tempMateria.getHrs_practica()}</td>
				<td>${tempMateria.getCreditos()}</td>
				<td><button class='btn btn-warning' style='margin-right:10px;'>
						<a style='text-decoration: none; color:white;' href="editar_materia.jsp?id=${tempMateria.getId_materia()}">Editar</a>
					</button>
	             	<button class='btn btn-danger'>
	             		<a style='text-decoration: none; color:white;' href="delete_materia.jsp?id=${tempMateria.getId_materia()}">Eliminar</a>
             		</button>
	             </td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<%} }%>
</body>
</html>