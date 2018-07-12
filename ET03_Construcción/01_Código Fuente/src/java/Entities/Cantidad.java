package Entities;
// Generated 8/02/2018 03:14:28 PM by Hibernate Tools 4.3.1



/**
 * KilometrajeProgramado
 */
public class Cantidad  implements java.io.Serializable {


     private String cantidad;

    public Cantidad() {
    }

    public Cantidad(String cantidad) {
       this.cantidad = cantidad;
    }
   
    public String getCantidad() {
        return this.cantidad;
    }
    
    public void setCantidad(String linea) {
        this.cantidad = linea;
    }

}


