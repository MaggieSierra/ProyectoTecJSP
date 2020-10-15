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
				String clave = request.getParameter("clave_materia");  
	    	    String nombre = request.getParameter("nombre");
	            int semestre = Integer.parseInt(request.getParameter("semestre"));
	            int hrs_t = Integer.parseInt(request.getParameter("hrs_t"));
	            int hrs_p = Integer.parseInt(request.getParameter("hrs_p"));
	            int creditos = Integer.parseInt(request.getParameter("creditos"));
	    			
	            Materia m = new Materia();  
	            m.setClave_materia(clave);
	            m.setNombre(nombre);  
	            m.setSemestre(semestre);
	            m.setHrs_teoria(hrs_t);
	            m.setHrs_practica(hrs_p);
	            m.setCreditos(creditos);
	            
	            int status = MateriaDAO.save(m);  
	            if(status>0){  
	                out.print("<p style='color: green; font-weight: bold;'>¡Registro guardado con éxito!</p>");  
	                request.getRequestDispatcher("ingresarMateria.jsp").include(request, response);  
	            }else{  
	                out.println("<p style='color: red; font-weight: bold;'>Sorry! Registro no guardado!</p>"); 
	                request.getRequestDispatcher("ingresarMateria.jsp").include(request, response); 
	            }	
			} 
		}%>
</body>
</html>