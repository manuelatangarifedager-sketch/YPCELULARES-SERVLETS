<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.loginrolesapp.modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"Admin".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect("/login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Panel de Administración - YP CELULARES</title>
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

        /* ====== CONTENIDO PRINCIPAL ====== */
        .admin-body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 100px);
            background-color: #fff;
            background-image: linear-gradient(135deg, #fff 70%, #FFD700 30%);
        }

        .panel {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
            border-top: 6px solid #FFD700;
            width: 400px;
        }

        h2 {
            color: #111;
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-bottom: 30px;
        }

        /* ====== BOTONES ====== */
        .btn {
            display: block;
            margin: 10px 0;
            padding: 14px 0;
            background-color: #FFD700;
            color: #000;
            font-weight: 600;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
        }

        .btn:hover {
            background-color: #e6c200;
            transform: translateY(-2px);
        }

        .logout {
            display: block;
            margin-top: 25px;
            color: #d11a2a;
            text-decoration: none;
            font-weight: 600;
        }

        .logout:hover {
            text-decoration: underline;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 600px) {
            header {
                font-size: 22px;
            }

            .panel {
                width: 90%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <header>
        YP CELULARES
    </header>

    <div class="admin-body">
        <div class="panel">
            <h2>👨‍💼 Bienvenido, <%= usuario.getNombre() %></h2>
            <p>Selecciona una opción de administración:</p>

            <a class="btn" href="../UsuarioServlet">👥 Administrar Usuarios</a>
            <a class="btn" href="../ProductoAdminServlet">🛍️ Administrar Productos</a>

            <a class="logout" href="../LogoutServlet">🚪 Cerrar sesión</a>
        </div>
    </div>
</body>
</html>
