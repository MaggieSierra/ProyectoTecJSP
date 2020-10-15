<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Horario, dao.HorarioDAO, java.util.*, java.sql.*, javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sabana - Tecnm</title>
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
				int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
				int id_materia = Integer.parseInt(request.getParameter("id_materia"));
				int id_carrera = Integer.parseInt(request.getParameter("id_carrera"));
				String clave = request.getParameter("clave_horario");  
	    	    String periodo = request.getParameter("periodo");
	    	    String grupo = request.getParameter("grupo");
	    	    int num_alumnos = Integer.parseInt(request.getParameter("alumnos"));
	    	    String aula = request.getParameter("aula");
	    	    String lunes = request.getParameter("lunes");
	    	    String martes = request.getParameter("martes");
	    	    String miercoles = request.getParameter("miercoles");
	    	    String jueves = request.getParameter("jueves");
	    	    String viernes = request.getParameter("viernes");
	    			
	            Horario h = new Horario(); 
	            h.setId_usuario(id_usuario);
	            h.setId_materia(id_materia);
	            h.setId_carrera(id_carrera);
	            h.setClave_horario(clave);
	            h.setPeriodo(periodo);
	            h.setGrupo(grupo);
	            h.setNum_alumnos(num_alumnos);
	            h.setAula(aula);
	            h.setLunes(lunes);
	            h.setMartes(martes);
	            h.setMiercoles(miercoles);
	            h.setJueves(jueves);
	            h.setViernes(viernes);
	            
	            int status = HorarioDAO.save(h);  
	            if(status>0){  
	                out.print("<p style='color: green; font-weight: bold;'>¡Registro guardado con éxito!</p>");  
	                request.getRequestDispatcher("ingresar_horario.jsp").include(request, response);  
	            }else{  
	                out.println("<p style='color: red; font-weight: bold;'>Sorry! Registro no guardado!</p>"); 
	                request.getRequestDispatcher("ingresar_horario.jsp").include(request, response); 
	            }	
			} 
		}%>
</body>
</html>