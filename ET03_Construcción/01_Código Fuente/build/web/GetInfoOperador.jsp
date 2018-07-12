<%-- 
    Document   : GetInfoOperador
    Created on : 18/04/2018, 03:59:20 PM
    Author     : simon.moya
--%>

<%@page import="Entities.Operator"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="Model.ControladorSQL"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    ControladorSQL Postgresql = new ControladorSQL(Persistence.createEntityManagerFactory("RS_DTBPU"));
    String html;
    html = "<table id=\"operators_table\" class=\"table table-striped\" style=\"width:100%; border-bottom: 0px;\">";
    html += "<thead style=\"visibility: hidden;\"><tr><th style=\"padding: 0px 0px;\"></th><th style=\"padding: 0px 0px;\"></th><th style=\"padding: 0px 0px;\"></th></tr></thead><tbody>";
    html += Postgresql.ListOperators(request.getParameter("fecha"));
    html += "</tbody><tfoot style=\"visibility: hidden;\"></tfoot></table>";
    out.print(html);            
%>
