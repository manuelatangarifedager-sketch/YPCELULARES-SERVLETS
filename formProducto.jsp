<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Nuevo Producto</title>
</head>
<body>
<h2>Agregar Producto</h2>
<form action="ProductoAdminServlet" method="post">
    <input type="hidden" name="accion" value="agregar">
    Nombre: <input type="text" name="nombre" required><br>
    Descripción: <input type="text" name="descripcion" required><br>
    Precio: <input type="number" step="0.01" name="precio" required><br>
    Stock: <input type="number" name="stock" required><br>
    <input type="submit" value="Guardar">
</form>
</body>
</html>
