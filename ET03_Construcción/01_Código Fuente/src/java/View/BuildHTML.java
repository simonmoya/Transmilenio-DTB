/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;
import Model.ControladorSQL;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Persistence;

/**
 *
 * @author simon.moya
 */
public class BuildHTML  {    
    
   ControladorSQL Postgresql = new ControladorSQL(Persistence.createEntityManagerFactory("RS_DTBPU"));

    public BuildHTML() {
    }    

    public String BuildFilter(String id_report) {
     String html = "";
     String Required = "";
          
     return html;      
    }       
    
    public String BuildTable(String sql, int num, String fecha) {    
       String QueryHTML = Postgresql.QueryHTML(sql,num);
     return QueryHTML;
    }
}
