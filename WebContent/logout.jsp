<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TECNM</title>
</head>
<body>

<%
	HttpSession session = request.getSession(false);
	if (session != null) {		
		HttpSession session_user=request.getSession();  
		out.print(session_user.getAttribute("usuario"));
	    session_user.invalidate();   
		out.print("Sesión cerrada exitosamente!");
	} else {
		out.print("Por favor, primero inicie sesión!");
	}
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
	dispatcher.forward(request, response);
%>

</body>
</html>