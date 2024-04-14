/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Java.Logica;

/**
 *
 * @author Usuario
 */
public class Usuario {
    
    private int id_usuario;
    private String nombre_usu;
    private String nombre;
    private String contrasena;
    private String direccion;
    
    public Usuario(int id_usuario, String nombre_usu, String nombre, String contrasena, String direccion){
        this.id_usuario = id_usuario;
        this.nombre_usu= nombre_usu;
        this.nombre = nombre;
        this.contrasena = contrasena;
        this.direccion = direccion;
    }
    public Usuario(){
        
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usu() {
        return nombre_usu;
    }

    public void setNombre_usu(String nombre_usu) {
        this.nombre_usu = nombre_usu;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
    
}
