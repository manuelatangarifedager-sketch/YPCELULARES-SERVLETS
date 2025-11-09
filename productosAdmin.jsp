<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.loginrolesapp.modelo.Producto" %>
<%
List<Producto> productos = (List<Producto>) request.getAttribute("productos");
%>

<html>
<head>
    <title>Administrar Productos</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        table { border-collapse: collapse; width: 90%; margin: auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
        .btn { padding: 5px 10px; border: none; cursor: pointer; color: white; }
        .agregar { background-color: #28a745; }
        .editar { background-color: #007bff; }
        .eliminar { background-color: #dc3545; }
    </style>
</head>
<body>

<h2 style="text-align:center;">📦 Administración de Productos</h2>

<div style="text-align:center; margin-bottom:20px;">
    <a href="ProductoAdminServlet?accion=nuevo" class="btn agregar">➕ Agregar nuevo producto</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Precio</th>
        <th>Stock</th>
        <th>Acciones</th>
    </tr>
    <% if (productos != null && !productos.isEmpty()) {
        for (Producto p : productos) { %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getNombre() %></td>
            <td><%= p.getDescripcion() %></td>
            <td>$<%= p.getPrecio() %></td>
            <td><%= p.getStock() %></td>
            <td>
                <a href="ProductoAdminServlet?accion=editar&id=<%= p.getId() %>" class="btn editar">✏️ Editar</a>
                <a href="ProductoAdminServlet?accion=eliminar&id=<%= p.getId() %>" class="btn eliminar" onclick="return confirm('¿Eliminar producto?');">🗑 Eliminar</a>
            </td>
        </tr>
    <% }} else { %>
        <tr><td colspan="6">No hay productos registrados.</td></tr>
    <% } %>
</table>

</body>
</html>
