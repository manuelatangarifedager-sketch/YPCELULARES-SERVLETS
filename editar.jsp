<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%
    Usuario u = (Usuario) request.getAttribute("usuario");
%>
<html>
<head><title>Editar Usuario</title></head>
<body>
<h2>Editar Usuario</h2>
<form action="UsuarioServlet" method="post">
    <input type="hidden" name="action" value="actualizar">
    <input type="hidden" name="id" value="<%= u.getId() %>">
    Nombre: <input type="text" name="nombre" value="<%= u.getNombre() %>" required><br>
    Correo: <input type="email" name="correo" value="<%= u.getCorreo() %>" required><br>
    Contraseña: <input type="password" name="password" value="<%= u.getPassword() %>" required><br>
    Rol:
    <select name="rol">
        <option value="cliente" <%= "cliente".equals(u.getRol()) ? "selected" : "" %>>Cliente</option>
        <option value="admin" <%= "admin".equals(u.getRol()) ? "selected" : "" %>>Administrador</option>
    </select><br>
    <input type="submit" value="Actualizar">
</form>
<a href="UsuarioServlet?action=listar">Volver</a>
</body>
</html>
