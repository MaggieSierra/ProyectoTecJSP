<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="dao.MateriaDAO,dao.HorarioDAO,dao.CarreraDAO,dao.UsuarioDAO,modelo.Horario,modelo.Materia,modelo.Usuario, modelo.Carrera"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sabana - Tecnm </title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<%
	HttpSession session_user=request.getSession();    
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
			
			List<Usuario> list_usuarios =  UsuarioDAO.getAllUsuarios();
			List<Carrera> list_carreras = CarreraDAO.getAllCarreras();
			List<Materia> list_materias = MateriaDAO.getAllMaterias();
			
			request.setAttribute("usuarios", list_usuarios);
			request.setAttribute("carreras", list_carreras);
			request.setAttribute("materias", list_materias);
	%>
	<div class="container">
		<ul class='nav nav-tabs'>
			<li class='nav-item'><a class='nav-link' href='index.jsp'>Inicio</a></li>
			<li class="nav-item"><a class="nav-link" href="materias.jsp">Materias</a></li>
			<li class="nav-item"><a class="nav-link active" href="sabana.jsp">Sabana de Materias</a></li>
			<li class="nav-item"><a class="nav-link" href="reportes.jsp">Reportes de Maestros</a></li>
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Cerrar Sesion</a></li>
		</ul>
		<br>
		<h2>Agregar Horario</h2>
		<form action="crear_horario.jsp" method="post" style="margin-top:20px;">
			<table>
				<tr>
					<td>Maestro:</td>
					<td><select name="id_usuario" class="form-control">
							<c:forEach items="${usuarios}" var="usuario">
								<option value="${usuario.getId_usuario()}">${usuario.getPrefijo()} ${usuario.getNombre()} ${usuario.getPrimer_apellido()} ${usuario.getSegundo_apellido()}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>Materia:</td>
					<td><select name="id_materia" class="form-control">
							<c:forEach items="${materias}" var="materia">
								<option value="${materia.getId_materia()}">${materia.getNombre()}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>Carrera:</td>
					<td><select name="id_carrera" class="form-control">
							<c:forEach items="${carreras}" var="carrera">
								<option value="${carrera.getId_carrera()}">${carrera.getNombre()}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>Clave Horario:</td>
					<td><input type="text" name="clave_horario" class="form-control" required /></td>
				</tr>
				<tr>
					<td>Periodo:</td>
					<td><input type="text" name="periodo" class="form-control" required /></td>
				</tr>
				<tr>
					<td>Grupo:</td>
					<td><input type="text" name="grupo" class="form-control" required /></td>
				</tr>
				<tr>
					<td>Numero de alumnos:</td>
					<td><input type="number" name="alumnos" class="form-control" required /></td>
				</tr>
				<tr>
					<td>Lunes:</td>
					<td><input type="text" name="lunes" class="form-control" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Martes:</td>
					<td><input type="text" name="martes" class="form-control" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Miercoles:</td>
					<td><input type="text" name="miercoles" class="form-control" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Jueves:</td>
					<td><input type="text" name="jueves" class="form-control" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Viernes:</td>
					<td><input type="text" name="viernes" class="form-control" placeholder="08:45-10:25"/></td>
				</tr>
				<tr>
					<td>Aula:</td>
					<td><input type="text" name="aula" class="form-control" placeholder="C-D1" required /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" class="btn btn-success" value="Guardar"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%} }%>
</body>
	
</html>