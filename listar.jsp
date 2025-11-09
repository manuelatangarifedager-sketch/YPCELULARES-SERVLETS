<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.loginrolesapp.modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"admin".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect("/error.jsp");
        return;
    }
%>
<html>
<head>
    <title>Usuarios Registrados - YP CELULARES</title>
    <style>
        /* ======== ESTILO GENERAL ======== */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            color: #222;
        }

        header {
            background-color: #FFD700;
            color: #000;
            text-align: center;
            padding: 20px 0;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 2px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
        }

        main {
            padding: 30px;
            max-width: 1000px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #111;
            margin-bottom: 20px;
        }

        /* ======== BOTONES Y LINKS ======== */
        .actions {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            background-color: #FFD700;
            color: #000;
            padding: 12px 20px;
            margin: 5px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #e6c200;
            transform: translateY(-2px);
        }

        /* ======== TABLA ======== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #FFD700;
            color: #000;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #fff5cc;
        }

        /* ======== LINKS EN TABLA ======== */
        a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .delete-link {
            color: #d11a2a;
        }

        /* ======== RESPONSIVE ======== */
        @media (max-width: 700px) {
            main {
                padding: 15px;
            }
            table {
                font-size: 13px;
            }
            th, td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <header>YP CELULARES</header>

    <main>
        <h2>Usuarios Registrados</h2>

        <div class="actions">
            <a href="admin/panelAdmin.jsp" class="btn">⬅️ Volver al Panel</a>
            <a href="UsuarioServlet?action=nuevo" class="btn">➕ Agregar Nuevo</a>
        </div>

        <table>
            <tr>
                <th>ID</th><th>Nombre</th><th>Correo</th><th>Rol</th><th>Acciones</th>
            </tr>
            <%
                List<Usuario> lista = (List<Usuario>) request.getAttribute("usuarios");
                if (lista != null) {
                    for (Usuario u : lista) {
            %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getNombre() %></td>
                <td><%= u.getCorreo() %></td>
                <td><%= u.getRol() %></td>
                <td>
                    <a href="UsuarioServlet?action=editar&id=<%=u.getId()%>">✏️ Editar</a> |
                    <a href="UsuarioServlet?action=eliminar&id=<%=u.getId()%>"
                       class="delete-link"
                       onclick="return confirm('¿Seguro de eliminar este usuario?')">🗑️ Eliminar</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </main>
</body>
</html>
