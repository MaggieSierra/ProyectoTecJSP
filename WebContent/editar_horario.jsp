<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="dao.MateriaDAO,dao.HorarioDAO,dao.CarreraDAO,dao.UsuarioDAO,modelo.Horario,modelo.Materia,modelo.Usuario, modelo.Carrera"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sabana - Tecnm</title>
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
				
				String sid=request.getParameter("id");  
	            int id=Integer.parseInt(sid);  
	 
	            Horario h= HorarioDAO.getHorarioById(id); 
	            request.setAttribute("h",h);
	            
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
			<li class="nav-item"><a class="nav-link active" href="materias.jsp">Materias</a></li>
			<li class="nav-item"><a class="nav-link" href="">Sabana de Materias</a></li>
			<li class="nav-item"><a class="nav-link" href="">Reportes de Docentes</a></li>
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Cerrar Sesion</a></li>
		</ul>
		<br>
		<h2>Editar Horario</h2>
		<form action="update_horario.jsp" method="post" style="margin-top:20px;">
			<table>
				<tr>
					<td><input type='hidden' name='id' class='form-control' required value='${h.getId_horario()}'/></td>
				</tr>
				<tr>
					<td>Maestro:</td>
					<td><select name="id_usuario" class="form-control">
							<c:forEach items="${usuarios}" var="usuario">
								<c:if test="${usuario.getId_usuario() == h.getId_usuario()}">
									<option value="${usuario.getId_usuario()}" selected>${usuario.getPrefijo()} ${usuario.getNombre()} ${usuario.getPrimer_apellido()} ${usuario.getSegundo_apellido()}</option>
								</c:if>
								<c:if test="${usuario.getId_usuario() != h.getId_usuario()}">
									<option value="${usuario.getId_usuario()}">${usuario.getPrefijo()} ${usuario.getNombre()} ${usuario.getPrimer_apellido()} ${usuario.getSegundo_apellido()}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>Materia:</td>
					<td><select name="id_materia" class="form-control">
							<c:forEach items="${materias}" var="materia">
								<c:if test="${materia.getId_materia() == h.getId_materia()}">
									<option value="${materia.getId_materia()}" selected>${materia.getNombre()}</option>
								</c:if>
								<c:if test="${materia.getId_materia() != h.getId_materia()}">
									<option value="${materia.getId_materia()}">${materia.getNombre()}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>Carrera:</td>
					<td><select name="id_carrera" class="form-control">
							<c:forEach items="${carreras}" var="carrera">
								<c:if test="${carrera.getId_carrera() == h.getId_carrera()}">
									<option value="${carrera.getId_carrera()}" selected>${carrera.getNombre()}</option>
								</c:if>
								<c:if test="${carrera.getId_carrera() != h.getId_carrera()}">
									<option value="${carrera.getId_carrera()}">${carrera.getNombre()}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>Clave Horario:</td>
					<td><input type="text" name="clave_horario" class="form-control" value="${h.getClave_horario()}" required /></td>
				</tr>
				<tr>
					<td>Periodo:</td>
					<td><input type="text" name="periodo" class="form-control" value="${h.getPeriodo()}" required /></td>
				</tr>
				<tr>
					<td>Grupo:</td>
					<td><input type="text" name="grupo" class="form-control" value="${h.getGrupo()}" required /></td>
				</tr>
				<tr>
					<td>Numero de alumnos:</td>
					<td><input type="number" name="alumnos" class="form-control" value="${h.getNum_alumnos()}" required /></td>
				</tr>
				<tr>
					<td>Lunes:</td>
					<td><input type="text" name="lunes" class="form-control" value="${h.getLunes()}" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Martes:</td>
					<td><input type="text" name="martes" class="form-control" value="${h.getMartes()}" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Miercoles:</td>
					<td><input type="text" name="miercoles" class="form-control" value="${h.getMiercoles()}" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Jueves:</td>
					<td><input type="text" name="jueves" class="form-control" value="${h.getJueves()}" placeholder="08:45-10:25" /></td>
				</tr>
				<tr>
					<td>Viernes:</td>
					<td><input type="text" name="viernes" class="form-control" value="${h.getViernes()}" placeholder="08:45-10:25"/></td>
				</tr>
				<tr>
					<td>Aula:</td>
					<td><input type="text" name="aula" class="form-control" placeholder="C-D1" value="${h.getAula()}" required /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" class="btn btn-warning" value="Actualizar"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%}} %>
</body>
</html>