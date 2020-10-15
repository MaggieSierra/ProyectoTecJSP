<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="dao.UsuarioDAO, modelo.Usuario, javax.servlet.http.HttpSession, java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	Usuario user = new Usuario();
	user.setUsuario(request.getParameter("usuario"));
	user.setContraseña(request.getParameter("password"));
	
	String pagina = "login.jsp";
	if(UsuarioDAO.validate(user)){
		Usuario us = UsuarioDAO.getUsuario(user);
		HttpSession session_user = request.getSession();
		session_user.setAttribute("id_usuario", us.getId_usuario());
		session_user.setAttribute("prefijo", us.getPrefijo());
		session_user.setAttribute("usuario", us.getUsuario());
		session_user.setAttribute("nombre", us.getNombre());
		session_user.setAttribute("apellido", us.getPrimer_apellido());
		if(us.getSegundo_apellido() == null){
			session_user.setAttribute("apellido","");
		}else{
			session_user.setAttribute("apellido",us.getSegundo_apellido());
		}
		session_user.setAttribute("rol", us.getId_rol());
		pagina = "/index.jsp";
	} else {
		out.print("¡Error de usuario o contraseña!");
		pagina = "/login.jsp";
	}
	RequestDispatcher dispatcher = request.getRequestDispatcher(pagina);
	dispatcher.forward(request, response);
%>
</body>
</html> 