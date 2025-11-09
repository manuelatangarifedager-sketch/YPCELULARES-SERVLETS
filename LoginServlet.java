package com.loginrolesapp.controlador;

import com.loginrolesapp.modelo.Usuario;
import com.loginrolesapp.modelo.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String clave = request.getParameter("password");

        Usuario u = dao.login(correo, clave);

        if (u != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", u);

            String rol = u.getRol();
            if (rol != null) rol = rol.trim().toLowerCase();

            if ("admin".equals(rol)) {
                response.sendRedirect(request.getContextPath() + "/admin/panelAdmin.jsp");
            } else if ("cliente".equals(rol)) {
                response.sendRedirect(request.getContextPath() + "/principal.jsp");
            } else {
                request.setAttribute("error", "Rol no reconocido.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Credenciales incorrectas.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
