/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.agc.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.agc.www._1_2_MySql_DB_entities.Employee;
import com.agc.www._1_3_MySql_DB_daos.Employee_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class servlent_0_0_1_employeeLoginAjax extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String userId = request.getParameter("userId");
            String password = request.getParameter("password");          
            
            Employee emp = new Employee();
            emp.setEmployeeId(Integer.parseInt(userId));
            emp.setEmployeePassword(password);
            
            Employee_DAO empDao = new Employee_DAO();
            
            HibernateSessionConMySql.MySQL_OpenCon();                     
            HibernateSessionConMySql.MySQL_beginTrans();
            empDao.insert(emp);
            HibernateSessionConMySql.MySQL_CommitTrans();
            
            response.getWriter().write("Done");
            
        }catch(Exception ex){
            ex.printStackTrace();
            
            HibernateSessionConMySql.MySQL_RollBack();
            response.getWriter().write("NotDone");
            System.out.println("Error ....................");
        }
        HibernateSessionConMySql.session.clear();
    }
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

