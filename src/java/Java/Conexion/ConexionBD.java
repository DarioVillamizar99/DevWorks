/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Java.Conexion;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class ConexionBD {
    // Configuracion de la base de datos con Dbeaver
    
    private String DB_driver = "";
    private String url = "";
    private String db = "";
    private String host ="";
    private String username = "";
    private String password = "";
    public Connection con = null;
    
    //Contructor sin parametros
    public ConexionBD(){
        DB_driver = "com.mysql.cj.jdbc.Driver";
        host = "localhost:3307";
        db = "ProyectoCalumet";
        url = "jdbc:mysql://"+ host + "/" + db +"?serverTimezone=UTC";
        username = "root";
        password = "1234";
        try {
            //asignacion del driver
            Class.forName(DB_driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            //Realizar la conexion
            con = DriverManager.getConnection(url, username, password);
            con.setTransactionIsolation(8);
        } catch (SQLException e) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    //retornar la conexion
    public Connection getConnection(){
        return con;
    }
 
    //cerrar la conexion
    
    public void closeConnection(Connection con){
        if (con != null){
            try {
                con.close();
            } catch (SQLException e) {
                Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }
}
   
