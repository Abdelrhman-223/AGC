/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.Student;
import com.modern.www._1_3_MySql_DB_daos.Student_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cdc
 */
public class addStudentAjax extends HttpServlet {

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
            System.out.println("Ready to execute SQL");
            String student_id = request.getParameter("student_id");
            String student_name = request.getParameter("student_name");
            String student_age = request.getParameter("student_age");            
            
            Student s = new Student();
            s.setStudentId(Integer.parseInt(student_id));
            s.setStudentName(student_name);
            s.setStudentAge(Integer.parseInt(student_age));
            
            Student_DAO sDao = new Student_DAO();
            
            HibernateSessionConMySql.MySQL_OpenCon();                     
            HibernateSessionConMySql.MySQL_beginTrans();
            sDao.insert(s);
            HibernateSessionConMySql.MySQL_CommitTrans();
            
            response.getWriter().write("Done");
            
        }catch(Exception e){
            e.printStackTrace();
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
