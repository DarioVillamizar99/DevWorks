/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Java.Logica;

import Java.Conexion.ConexionBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author Dario Villamizar B
 */
public class Usuario_dao {
    //Nueva conexion
    Connection con;
    ConexionBD cn = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;
    
    public Usuario validarUsu(String Nombre_usu, String Contrasena){
        Usuario u = new Usuario();
        String sql = "SELECT *FROM usuario WHERE nombre_usuario = ? AND contrasena = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, Nombre_usu);
            ps.setString(2, Contrasena);
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setId_usuario(rs.getInt("Id_usuario"));
                u.setNombre(rs.getString("Nombre"));
                u.setNombre_usu(rs.getString("Nombre_usuario"));
                u.setContrasena(rs.getString("Contrasena"));
                u.setDireccion(rs.getString("Direccion"));
            }
        } catch (SQLException e) {
            System.err.println(e.toString());
        }
        return u;
    }
    
    //metodo Registrar Usuarios
    public boolean Registrar(String Nombre, String Nombre_usu, String Contrasena, String Direccion){
        String sql = "INSERT INTO Usuario (nombre,nombre_usuario,contrasena,direccion) VALUES (?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, Nombre);
            ps.setString(2, Nombre_usu);
            ps.setString(3, Contrasena);
            ps.setString(4, Direccion);
            ps.execute();
            return true;
            
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }
    }
}
