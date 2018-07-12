<%-- 
    Document   : GetInfoFlota
    Created on : 18/04/2018, 03:59:20 PM
    Author     : simon.moya
--%>

<%@page import="View.BuildHTML"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    BuildHTML TableHTML = new BuildHTML();
    String table;    
    String Sql;

    Sql = "";
    
    if (request.getParameter("operador")!=null){
        switch ((String)request.getParameter("type")){
//Query Flota Total            
            case "1":  Sql = "Select id_operador, b.etiqueta, b.matricula, c.descripcion_tipo_vehiculo, c.capacidad_tipo_vehiculo, d.descripcion_tipo_servicio "
                             + " From flota_total a, vehiculo b, tipo_vehiculo c, tipo_servicio d, fecha f "
                             + " Where "
                             + " a.id_vehiculo = b.id_vehiculo "
                             + " And b.id_tipo_vehiculo = c.id_tipo_vehiculo "
                             + " And b.id_tipo_servicio = d.id_tipo_servicio "
                             + " And f.id_fecha = a.id_fecha_operacion" 
                             + " And f.fecha = '"+(String)request.getParameter("fecha")+"' "
                             + " And a.id_operador = "+(String)request.getParameter("operador");
                       break;
//Query Flota Programada            
            case "2":  Sql = "Select distinct id_operador, servbus, '', '', 0, '' From flota_programada fp, fecha f"+
                             " Where "+
                             " f.id_fecha = fp.id_fecha_programacion" +
                             " And f.fecha = '"+(String)request.getParameter("fecha")+"' "+
                             " And fp.id_operador = "+(String)request.getParameter("operador");
                       break;
//Query Flota Asignada                                   
            case "3":  Sql = "Select id_operador, b.etiqueta, b.matricula, c.descripcion_tipo_vehiculo, c.capacidad_tipo_vehiculo, d.descripcion_tipo_servicio "
                             + " From flota_total a, vehiculo b, tipo_vehiculo c, tipo_servicio d, fecha f "
                             + " Where "
                             + " a.id_vehiculo = b.id_vehiculo "
                             + " And b.id_tipo_vehiculo = c.id_tipo_vehiculo "
                             + " And b.id_tipo_servicio = d.id_tipo_servicio "
                             + " And estado_asignacion = 'A' "
                             + " And f.id_fecha = a.id_fecha_operacion" 
                             + " And f.fecha = '"+(String)request.getParameter("fecha")+"' "
                             + " And a.id_operador = "+(String)request.getParameter("operador");
                       break;
//Query Flota Inmovilizada            
            case "4":  Sql = "Select id_operador, b.etiqueta, b.matricula, c.descripcion_tipo_vehiculo, c.capacidad_tipo_vehiculo, d.descripcion_tipo_servicio "
                             + " From flota_total a, vehiculo b, tipo_vehiculo c, tipo_servicio d, fecha f "
                             + " Where "
                             + " a.id_vehiculo = b.id_vehiculo "
                             + " And b.id_tipo_vehiculo = c.id_tipo_vehiculo "
                             + " And b.id_tipo_servicio = d.id_tipo_servicio "
                             + " And Not a.id_fecha_inmovilizacion is null "
                             + " And f.id_fecha = a.id_fecha_operacion" 
                             + " And f.fecha = '"+(String)request.getParameter("fecha")+"' "
                             + " And a.id_operador = "+(String)request.getParameter("operador");
                       break;     
//Query Flota Desvinculada                                   
            case "5":  Sql = "Select id_operador, b.etiqueta, b.matricula, c.descripcion_tipo_vehiculo, c.capacidad_tipo_vehiculo, d.descripcion_tipo_servicio "
                             + " From flota_total a, vehiculo b, tipo_vehiculo c, tipo_servicio d, fecha f "
                             + " Where "
                             + " a.id_vehiculo = b.id_vehiculo "
                             + " And b.id_tipo_vehiculo = c.id_tipo_vehiculo "
                             + " And b.id_tipo_servicio = d.id_tipo_servicio "
                             + " And estado_vinculacion = 'D' "
                             + " And f.id_fecha = a.id_fecha_operacion" 
                             + " And f.fecha = '"+(String)request.getParameter("fecha")+"' "
                             + " And a.id_operador = "+(String)request.getParameter("operador");
                       break;                       
//Query Flota Inmovilizada            
            case "6":  Sql = "Select id_operador, b.etiqueta, b.matricula, c.descripcion_tipo_vehiculo, c.capacidad_tipo_vehiculo, d.descripcion_tipo_servicio "
                             + " From flota_total a, vehiculo b, tipo_vehiculo c, tipo_servicio d, fecha f "
                             + " Where "
                             + " a.id_vehiculo = b.id_vehiculo "
                             + " And b.id_tipo_vehiculo = c.id_tipo_vehiculo "
                             + " And b.id_tipo_servicio = d.id_tipo_servicio "
                             + " And a.id_fecha_inmovilizacion is null "
                             + " And estado_vinculacion != 'D' "
                             + " And f.id_fecha = a.id_fecha_operacion" 
                             + " And f.fecha = '"+(String)request.getParameter("fecha")+"' "
                             + " And a.id_operador = "+(String)request.getParameter("operador");
                       break;     
            }    
            
        }
       System.out.println(Sql);
        table = TableHTML.BuildTable(Sql, 6, (String)request.getParameter("fecha"));        
        out.print((table));            
%>
