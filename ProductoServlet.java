package com.loginrolesapp.controlador;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import com.loginrolesapp.modelo.*;

public class ProductoServlet extends HttpServlet {
    ProductoDAO dao = new ProductoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Producto> lista = dao.listar();
        request.setAttribute("productos", lista);
        RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
        dispatcher.forward(request, response);
    }
}
