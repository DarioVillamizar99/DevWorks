/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Java.Logica;

/**
 *
 * @author Usuario
 */
public class Salas {
    
    private int id_salas;
    private String nombre;
    private int num_mesas;
    
    public Salas(int id_salas, String nombre, int num_mesas){
        this.id_salas = id_salas;
        this.nombre = nombre;
        this.num_mesas = num_mesas;
    }
    
    public Salas(){
        
    }

    public int getId_salas() {
        return id_salas;
    }

    public void setId_salas(int id_salas) {
        this.id_salas = id_salas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNum_mesas() {
        return num_mesas;
    }

    public void setNum_mesas(int num_mesas) {
        this.num_mesas = num_mesas;
    }
    
    
}
