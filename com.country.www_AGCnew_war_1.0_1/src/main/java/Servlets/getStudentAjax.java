/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.Student;
import com.modern.www._1_3_MySql_DB_daos.Student_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsonFiles.student_json;

/**
 *
 * @author cdc
 */
public class getStudentAjax extends HttpServlet {

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
        try {
            Student_DAO student_dao = new Student_DAO();
            List<Student> student_List = student_dao.GetAllStudents();

            student_json[] array = new student_json[student_List.size()];

            for (int i = 0; i < student_List.size(); i++) {
                Student s = student_List.get(i);

                student_json record = new student_json();
                record.setStudent_id("" + s.getStudentId());
                record.setStudent_name(s.getStudentName());
                record.setStudent_age("" + s.getStudentAge());

                array[i] = record;
            }

            ObjectMapper mapper = new ObjectMapper();

            String json = mapper.writeValueAsString(array);
            // success
            response.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error.....!");
            response.getWriter().write("Error");
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
