<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Producto" %>
<%
Producto p = (Producto) request.getAttribute("producto");
%>
<html>
<head><title>Editar Producto</title></head>
<body>
<h2>Editar Producto</h2>
<form action="ProductoAdminServlet" method="post">
    <input type="hidden" name="accion" value="actualizar">
    <input type="hidden" name="id" value="<%= p.getId() %>">
    Nombre: <input type="text" name="nombre" value="<%= p.getNombre() %>" required><br>
    Descripción: <input type="text" name="descripcion" value="<%= p.getDescripcion() %>" required><br>
    Precio: <input type="number" step="0.01" name="precio" value="<%= p.getPrecio() %>" required><br>
    Stock: <input type="number" name="stock" value="<%= p.getStock() %>" required><br>
    <input type="submit" value="Actualizar">
</form>
</body>
</html>
