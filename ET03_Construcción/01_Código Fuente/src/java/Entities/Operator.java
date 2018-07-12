package Entities;
// Generated 5/03/2018 09:42:02 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Id;

/**
 *
 * @author simon.moya
 */
public class Operator  implements java.io.Serializable {

     private int idOperator;
     private String nameOperator;
     private int Contador;
     private int Asignados;
     private int Inmovilizados;
     private int Programados;
     private int Desvinculados;
    public Operator() {
    }

	
    public Operator(int idOperator, String nameOperator, int Contador, int Asignados, int Inmovilizados, int Programados, int Desvinculados) {
       this.idOperator = idOperator;
       this.nameOperator = nameOperator;
       this.Contador = Contador;
       this.Inmovilizados = Inmovilizados;
       this.Asignados = Asignados;
       this.Programados = Programados;
       this.Desvinculados = Desvinculados;
    }
   
     @Id 

    
    @Column(name="id_operador", unique=true, nullable=false)
    public int getIdOperator() {
        return this.idOperator;
    }
    
    public void setIdOperator(int idOperator) {
        this.idOperator = idOperator;
    }

    
    @Column(name="title_report", nullable=false, length=40)
    public String getNameOperator() {
        return this.nameOperator;
    }
    
    public void setNameOperator(String nameOperator) {
        this.nameOperator = nameOperator;
    }


    @Column(name="contador", nullable=false)
    public int getContador() {
        return this.Contador;
    }

    
    public void setContador(int Contador) {
        this.Contador = Contador;
    }    

    /**
     *
     * @return
     */
    @Column(name="inmovilizados", nullable=false)
    public int getInmovilizados() {
        return this.Inmovilizados;
    }

    
    public void setInmovilizados(int Inmovilizados) {
        this.Inmovilizados = Inmovilizados;
    }    

    @Column(name="asignados", nullable=false)
    public int getAsignados() {
        return this.Asignados;
    }

    
    public void setAsignados(int Asignados) {
        this.Asignados = Asignados;
    }    

    @Column(name="programados", nullable=false)
    public int getProgramados() {
        return this.Programados;
    }

    
    public void setProgramados(int Programados) {
        this.Programados = Programados;
    }    

    @Column(name="desvinculados", nullable=false)
    public int getDesvinculados() {
        return this.Desvinculados;
    }

    
    public void setDesvinculados(int Desvinculados) {
        this.Desvinculados = Desvinculados;
    }    
    
}


