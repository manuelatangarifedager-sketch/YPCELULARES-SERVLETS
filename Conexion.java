package com.loginrolesapp.modelo;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;

    public Connection getConexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3308/login_roles_db", "root", "admin"); // cambia tu contraseña si aplica
        } catch (Exception e) {
            System.out.println("Error en la conexión: " + e);
        }
        return con;
    }
}
