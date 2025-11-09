<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<html>
<head><title>Agregar Usuario</title></head>
<body>
<h2>Nuevo Usuario</h2>
<form action="UsuarioServlet" method="post">
    <input type="hidden" name="action" value="agregar">
    Nombre: <input type="text" name="nombre" required><br>
    Correo: <input type="email" name="correo" required><br>
    Contraseña: <input type="password" name="password" required><br>
    Rol:
    <select name="rol">
        <option value="cliente">Cliente</option>
        <option value="admin">Administrador</option>
    </select><br>
    <input type="submit" value="Guardar">
</form>
<a href="UsuarioServlet?action=listar">Volver</a>
</body>
</html>
