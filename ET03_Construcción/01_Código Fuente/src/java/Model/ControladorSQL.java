/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entities.Cantidad;
import Entities.Operator;
import static Model.Password.checkPassword;
import static Model.Password.hashPassword;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.text.DecimalFormat;

/**
 * Controla la ejecución de las diversas consultas que se requieren para la extracción de información de vehículos y asignaciones en la Base de datos Flotas de PostgreSQL
 * 
 * @author gabrielgonzalez
 */
public class ControladorSQL implements Serializable {

    public ControladorSQL(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;
    

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    /**
     * Método que permite realizar la consulta de asignaciones por periodos de 30 minutos a la base de datos Zonal_SAEExplotacionNext_Historical
     *
     * @return 
     */

       
    public List<Operator> ConsultOperator(String fecha) {

        EntityManager em = getEntityManager();
        List<Operator> listaI = new ArrayList<Operator>();
        List<Operator> listaII = new ArrayList<Operator>();

        try {
            String sql = "Select o.id_operador, o.nombre_informe, count(*) as contador, b.num_inmovilizados, c.num_asignados, d.num_programados, e.num_desvinculados \n" +
                         "From flota_total ft, fecha f, operador o, \n" +
                         "(Select id_operador, count(*) as num_inmovilizados \n" +
                         "From flota_total a, fecha b\n" +
                         "Where \n" +
                         "a.id_fecha_operacion = b.id_fecha \n" +
                         "And Not a.id_fecha_inmovilizacion is null\n" +
                         "And b.fecha = '"+fecha+"'\n" +
                         "Group By a.id_operador) b, \n" +
                         "(Select id_operador, count(*) as num_asignados \n" +
                         "From flota_total a, fecha b\n" +
                         "Where \n" +
                         "a.id_fecha_operacion = b.id_fecha \n" +
                         "And estado_asignacion = 'A'\n" +
                         "And b.fecha = '"+fecha+"'\n" +
                         "Group By a.id_operador) c, \n"+
                         "(Select a.id_operador, count(*) as num_programados\n" +
                         "FROM\n" +
                         "(SELECT distinct fecha, id_operador, servbus\n" +
                         " From flota_programada a, fecha b\n" +
                         " where\n" +
                         " a.id_fecha_programacion = b.id_fecha\n" +
                         " and b.fecha = '"+fecha+"') a\n" +
                         " Group by a.id_operador) d, \n "+
                         "(Select id_operador, count(*) as num_desvinculados \n" +
                         "From flota_total a, fecha b\n" +
                         "Where \n" +
                         "a.id_fecha_operacion = b.id_fecha \n" +
                         "And estado_vinculacion = 'D'\n" +
                         "And b.fecha = '"+fecha+"'\n" +
                         "Group By a.id_operador) e \n"+                    
                         "where\n" +
                         "ft.id_fecha_operacion = f.id_fecha\n" +
                         "And ft.id_operador = o.id_operador\n" +
                         "And ft.id_operador = b.id_operador\n" +
                         "And ft.id_operador = c.id_operador\n" +
                         "And ft.id_operador = d.id_operador\n" +
                         "And ft.id_operador = e.id_operador\n" +
                         "And f.fecha = '"+fecha+"'\n" +
                         "Group by o.id_operador, o.nombre_informe, b.num_inmovilizados, c.num_asignados, d.num_programados, e.num_desvinculados \n" +
                         "Order by 1 ";
            System.out.println("Consulta SQL: "+sql);
            em.getTransaction().begin();
            Query query = em.createNativeQuery(sql);
            listaI = query.getResultList();
            em.getTransaction().commit();
            Iterator it = listaI.iterator();
            while (it.hasNext()) {
                Object[] obj = (Object[]) it.next();
                Operator a = new Operator();
                a.setIdOperator(Integer.parseInt(obj[0].toString()));
                a.setNameOperator(obj[1].toString());
                a.setContador(Integer.parseInt(obj[2].toString()));                
                a.setInmovilizados(Integer.parseInt(obj[3].toString()));                
                a.setAsignados(Integer.parseInt(obj[4].toString()));                
                a.setProgramados(Integer.parseInt(obj[5].toString()));                
                a.setDesvinculados(Integer.parseInt(obj[6].toString()));                
                listaII.add(a);                
            }
        } catch (NumberFormatException e) {
            em.getTransaction().rollback();
            System.out.println("Se ha producido un error mientras se intentaba consultar " + e.getMessage());
        } finally {
            if (em != null) {
                em.close();
            }
        }
        System.out.println("Finalizó Consulta de reportes\n");
        return listaII;
    }
   
    public String ListOperators(String fecha) {
           String GUIList = "";
           List<Operator> ListaReport = ConsultOperator(fecha);  
           DecimalFormat formateador = new DecimalFormat("###,###");
           for (Operator lista : ListaReport) {
               
            GUIList = GUIList + "<tr><td id=\" "+lista.getIdOperator()+" \" style=\"cursor: pointer;\"> "+lista.getNameOperator()+
                        " </td><td>"+formateador.format (lista.getContador())+
                        "</td><td>"+formateador.format (lista.getInmovilizados())+
                        "</td><td>"+formateador.format (lista.getAsignados())+
                        "</td><td>"+formateador.format (lista.getProgramados())+
                        "</td><td>"+formateador.format (lista.getDesvinculados())+
                        "</td></tr>";
            System.out.println("Entra acá "+GUIList + " " + formateador.format (1000) );
           }
           return GUIList;
    }
    
    /**
     *
     * @param sql
     * @param num
     * @return
     */
    public String QueryHTML(String sql, int num){
      EntityManager em = getEntityManager();
      System.out.println("Este es: "+num);
      String HTML = "[";
      em.getTransaction().begin();
      Query query = em.createNativeQuery(sql);
      System.out.println("Query Flotas: "+sql);
      List lista = query.getResultList();
      em.getTransaction().commit();
      Iterator it = lista.iterator();
      int count = 0;
      while (it.hasNext()) {
        Object[] obj = (Object[]) it.next();
        if (count > 0) HTML += ",";
        HTML += "[";
       for ( int i = 0; i < num; i++ ) {  
        if (i > 0) HTML += ",";   
        HTML += "'"+ obj[i].toString() +"'";
       }
       HTML += "]";
       count++;
      }
      HTML += "]";
String test_passwd = "Jcami2008";
//Funciona con PHP Convirtiendo el 2y DE PHP por el 2a de Java
		String test_hash = "$2a$10$6.K73PRBmoDlU1S1XH93WuGVHT0EuuYZmX0ZIvPldpBUzyJUP/y4S";

		System.out.println("Testing BCrypt Password hashing and verification");
		System.out.println("Test password: " + test_passwd);
		System.out.println("Test stored hash: " + test_hash);
		System.out.println("Hashing test password...");
		System.out.println();

		String computed_hash = hashPassword(test_passwd);
		System.out.println("Test computed hash: " + computed_hash);
		System.out.println();
		System.out.println("Verifying that hash and stored hash both match for the test password...");
		System.out.println();

		String compare_test = checkPassword(test_passwd, test_hash)
			? "Passwords Match" : "Passwords do not match";
		String compare_computed = checkPassword(test_passwd, computed_hash)
			? "Passwords Match" : "Passwords do not match";

		System.out.println("Verify against stored hash:   " + compare_test);
		System.out.println("Verify against computed hash: " + compare_computed);      
     return HTML;   
    }
}
