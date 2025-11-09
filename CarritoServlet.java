package com.loginrolesapp.controlador;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.loginrolesapp.modelo.*;

public class CarritoServlet extends HttpServlet {

    Conexion cn = new Conexion();

    // ============================================================
    //  POST → agregar producto al carrito
    // ============================================================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Si el formulario tiene acción específica (eliminar o vaciar)
        String accion = request.getParameter("accion");

        try (Connection con = cn.getConexion()) {

            if ("eliminar".equals(accion)) {
                // ❌ Eliminar producto individual
                int idPedido = Integer.parseInt(request.getParameter("id_pedido"));
                String sqlDelete = "DELETE FROM pedidos WHERE id = ? AND id_usuario = ?";
                PreparedStatement ps = con.prepareStatement(sqlDelete);
                ps.setInt(1, idPedido);
                ps.setInt(2, usuario.getId());
                ps.executeUpdate();

            } else if ("vaciar".equals(accion)) {
                // 🗑 Vaciar carrito completo
                String sqlVaciar = "DELETE FROM pedidos WHERE id_usuario = ? AND estado = 'pendiente'";
                PreparedStatement ps = con.prepareStatement(sqlVaciar);
                ps.setInt(1, usuario.getId());
                ps.executeUpdate();

            } else {
                // 🛒 Agregar producto al carrito
                int idProducto = Integer.parseInt(request.getParameter("id"));
                int cantidad = 1;

                // Verificar si el producto ya existe en el carrito
                String sqlVerificar = "SELECT id, cantidad FROM pedidos WHERE id_usuario = ? AND id_producto = ? AND estado = 'pendiente'";
                PreparedStatement psVerificar = con.prepareStatement(sqlVerificar);
                psVerificar.setInt(1, usuario.getId());
                psVerificar.setInt(2, idProducto);
                ResultSet rs = psVerificar.executeQuery();

                if (rs.next()) {
                    int idPedido = rs.getInt("id");
                    int cantidadActual = rs.getInt("cantidad");
                    String sqlActualizar = "UPDATE pedidos SET cantidad = ? WHERE id = ?";
                    PreparedStatement psActualizar = con.prepareStatement(sqlActualizar);
                    psActualizar.setInt(1, cantidadActual + 1);
                    psActualizar.setInt(2, idPedido);
                    psActualizar.executeUpdate();
                } else {
                    String sqlInsertar = "INSERT INTO pedidos (id_usuario, id_producto, cantidad, estado) VALUES (?, ?, ?, 'pendiente')";
                    PreparedStatement psInsertar = con.prepareStatement(sqlInsertar);
                    psInsertar.setInt(1, usuario.getId());
                    psInsertar.setInt(2, idProducto);
                    psInsertar.setInt(3, cantidad);
                    psInsertar.executeUpdate();
                }
            }

        } catch (Exception e) {
            System.out.println("❌ Error en carrito: " + e.getMessage());
        }

        response.sendRedirect("CarritoServlet"); // Vuelve a mostrar el carrito actualizado
    }

    // ============================================================
    //  GET → mostrar carrito del usuario
    // ============================================================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, Object>> pedidos = new ArrayList<>();
        double total = 0.0;

        try (Connection con = cn.getConexion()) {
            String sql = """
                SELECT p.id AS id_pedido, pr.nombre, pr.precio, p.cantidad, 
                       (pr.precio * p.cantidad) AS subtotal
                FROM pedidos p
                INNER JOIN productos pr ON p.id_producto = pr.id
                WHERE p.id_usuario = ? AND p.estado = 'pendiente'
                ORDER BY p.id DESC
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, usuario.getId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> item = new HashMap<>();
                item.put("id_pedido", rs.getInt("id_pedido"));
                item.put("nombre", rs.getString("nombre"));
                item.put("precio", rs.getDouble("precio"));
                item.put("cantidad", rs.getInt("cantidad"));
                item.put("subtotal", rs.getDouble("subtotal"));
                total += rs.getDouble("subtotal");
                pedidos.add(item);
            }

        } catch (Exception e) {
            System.out.println("❌ Error al listar el carrito: " + e.getMessage());
        }

        request.setAttribute("pedidos", pedidos);
        request.setAttribute("total", total);
        RequestDispatcher dispatcher = request.getRequestDispatcher("verCarrito.jsp");
        dispatcher.forward(request, response);
    }
}
