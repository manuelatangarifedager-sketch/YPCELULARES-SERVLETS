package com.loginrolesapp.controlador;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // ❌ Solo elimina la sesión en memoria
        }

        response.sendRedirect("login.jsp"); // ✅ No borra carrito
    }
}

