<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<html>
<head>
    <title>Principal - YP CELULARES</title>
    <style>
        /* ====== ESTILO GENERAL ====== */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            color: #222;
            margin: 0;
            padding: 0;
        }

        /* ====== ENCABEZADO ====== */
        header {
            background-color: #FFD700;
            color: #000;
            text-align: center;
            padding: 20px 0;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 2px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        /* ====== CONTENIDO ====== */
        .panel-container {
            max-width: 800px;
            margin: 60px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-top: 6px solid #FFD700;
        }

        h2 {
            color: #111;
            font-size: 24px;
            margin-bottom: 10px;
            text-align: center;
        }

        p {
            text-align: center;
            font-size: 16px;
            color: #333;
            margin-bottom: 30px;
        }

        h3 {
            color: #000;
            border-bottom: 2px solid #FFD700;
            padding-bottom: 8px;
            margin-bottom: 15px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            background-color: #f8f8f8;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, background 0.3s;
        }

        ul li:hover {
            background-color: #FFD700;
            transform: scale(1.03);
        }

        ul li a {
            display: block;
            text-decoration: none;
            color: #000;
            padding: 15px;
            font-weight: 500;
            font-size: 16px;
        }

        ul li a:hover {
            color: #111;
        }

        hr {
            border: none;
            height: 2px;
            background-color: #FFD700;
            margin: 30px 0;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 600px) {
            .panel-container {
                width: 90%;
                padding: 25px;
            }
            header {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
    <header>
        YP CELULARES
    </header>

    <div class="panel-container">
        <h2>Bienvenido, <%= usuario.getNombre() %>!</h2>
        <p>Rol: <%= usuario.getRol() %></p>

        <hr>

        <h3>Opciones disponibles:</h3>
        <ul>
            <li><a href="ProductoServlet">🛍️ Ver productos</a></li>
            <li><a href="verCarrito.jsp">🛒 Ver carrito</a></li>
            <li><a href="LogoutServlet">🚪 Cerrar sesión</a></li>
        </ul>
    </div>
</body>
</html>
