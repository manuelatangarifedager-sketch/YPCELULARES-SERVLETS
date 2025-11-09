package com.loginrolesapp.controlador;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import  com.loginrolesapp.modelo.Usuario;
import com.loginrolesapp.modelo.UsuarioDAO;

public class UsuarioServlet extends HttpServlet {
    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
                List<Usuario> lista = dao.listar();
                request.setAttribute("usuarios", lista);
                request.getRequestDispatcher("usuarios/listar.jsp").forward(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher("usuarios/agregar.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Usuario u = dao.buscarPorId(idEditar);
                request.setAttribute("usuario", u);
                request.getRequestDispatcher("usuarios/editar.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("UsuarioServlet?action=listar");
                break;

            default:
                response.sendRedirect("usuarios/listar.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            Usuario u = new Usuario();
            u.setNombre(request.getParameter("nombre"));
            u.setCorreo(request.getParameter("correo"));
            u.setPassword(request.getParameter("password"));
            u.setRol(request.getParameter("rol"));
            dao.agregar(u);
            response.sendRedirect("UsuarioServlet?action=listar");
        }

        if ("actualizar".equals(action)) {
            Usuario u = new Usuario();
            u.setId(Integer.parseInt(request.getParameter("id")));
            u.setNombre(request.getParameter("nombre"));
            u.setCorreo(request.getParameter("correo"));
            u.setPassword(request.getParameter("password"));
            u.setRol(request.getParameter("rol"));
            dao.actualizar(u);
            response.sendRedirect("UsuarioServlet?action=listar");
        }
    }
}

