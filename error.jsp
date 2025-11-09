<%@ page isErrorPage="true" %>
<h2 style="color:red;">Ocurrió un error</h2>
<p><%= request.getAttribute("error") != null ? request.getAttribute("error") : "Acceso no permitido o error del sistema." %></p>
<a href="login.jsp">Volver al inicio de sesión</a>
