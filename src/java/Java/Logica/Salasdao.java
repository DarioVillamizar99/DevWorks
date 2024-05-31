/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Java.Logica;

import Java.Conexion.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class Salasdao {
    //realizar conexion de BD

    Connection con;
    ConexionBD cn = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;

    public boolean insertarSala(String Nombre, int Num_mesas) {
        String sentencia = "INSERT INTO Salas (nombre,num_mesa) VALUES (?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sentencia);
            ps.setString(1, Nombre);
            ps.setInt(2, Num_mesas);
            ps.execute();
            return true;

        } catch (SQLException e) {
            System.err.println(e.toString());
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }
    }

    public List mostrarSala() {
        List<Salas> Lista = new ArrayList();
        String sql = "Select * FROM Salas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Salas sl = new Salas();
                sl.setId_salas(rs.getInt("id_salas"));
                sl.setNombre(rs.getString("nombre"));
                sl.setNum_mesas(rs.getInt("num_mesa"));
                Lista.add(sl);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return Lista;
    }
    
    public Salas verSala(int id_sala) {
        Salas sl = new Salas();
        String sql = "SELECT * FROM salas WHERE id_sala = ?";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                sl.setId_salas(rs.getInt("id_salas"));
                sl.setNombre(rs.getString("nombre"));
            }
        } catch (SQLException e) {
            System.err.println(e.toString());
        }
        return sl;
    }
    
    public boolean Eliminar(int id_sala) {
        String sql = "DELETE FROM salas WHERE id_sala = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_sala);
            ps.executeQuery();
            return true;
        } catch (SQLException e) {
            System.err.println(e.toString());
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println(e.toString());
            }
        }
    }
    
    public boolean Modificar(int id_sala, String nombre, int num_mesa) {
        String sql = "UPDATE salas SET nombre = ?, num_mesa = ? WHERE id_salas = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setInt(2, num_mesa);
            ps.setInt(3, id_sala);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
        finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println(e.toString());
            }
        }
    }
}
