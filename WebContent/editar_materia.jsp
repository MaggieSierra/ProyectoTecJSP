<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Materia, dao.MateriaDAO, java.util.*, java.sql.*, javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Materias - Tecnm</title>
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
			if(rol != 1){
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}else{
				
				String sid=request.getParameter("id");  
	            int id=Integer.parseInt(sid);  
	 
	            Materia m= MateriaDAO.getMateriaById(id); 
	            request.setAttribute("m",m);
	%>
	<div class="container">
		<ul class='nav nav-tabs'>
			<li class='nav-item'><a class='nav-link' href='index.jsp'>Inicio</a></li>
			<li class="nav-item"><a class="nav-link active" href="materias.jsp">Materias</a></li>
			<li class="nav-item"><a class="nav-link" href="">Sabana de Materias</a></li>
			<li class="nav-item"><a class="nav-link" href="">Reportes de Docentes</a></li>
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Cerrar Sesion</a></li>
		</ul>
		<br>
		<h2>Editar Materia</h2>
		<form action="update_materia.jsp" method="post" style="margin-top:20px;">
			<table>
				<tr>
					<td><input type='hidden' name='id' class='form-control' required value='${m.getId_materia()}'/></td>
				</tr>
				<tr>
					<td>Clave Materia:</td>
					<td><input type="text" name="clave_materia" class="form-control" required value='${m.getClave_materia()}' /></td>
				</tr>
				<tr>
					<td>Nombre:</td>
					<td><input type="text" name="nombre" class="form-control" required value='${m.getNombre()}' /></td>
				</tr>
					<tr>
					<td>Semestre:</td>
					<td><input type="number" name="semestre" class="form-control" required value='${m.getSemestre()}'/></td>
				</tr>
					<tr>
					<td>Hrs. Teoricas:</td>
					<td><input type="number" name="hrs_t" class="form-control" required value='${m.getHrs_teoria()}' /></td>
				</tr>
					<tr>
					<td>Hrs. Prácticas:</td>
					<td><input type="number" name="hrs_p" class="form-control" required value='${m.getHrs_practica()}'/></td>
				</tr>
					<tr>
					<td>Créditos:</td>
					<td><input type="number" name="creditos" class="form-control" required value='${m.getCreditos()}'/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" class="btn btn-warning" value="Actualizar"/>
					</td>
				</tr>
			</table>
		</form>
		<br/>
	</div>
	<%}} %>
</body>
</html>