/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author smoya
 */
public class ServletLogic extends HttpServlet {
        @Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

        @Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
            String Reporte =request.getParameter("Reporte");
            request.getSession().setAttribute("id_report", Reporte);
            request.getSession().setAttribute("id_call", 0);
            this.getServletContext().getRequestDispatcher("/report.jsp").forward(request, response);
        }        
    
}
