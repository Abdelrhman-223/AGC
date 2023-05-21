/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.Student;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author cdc
 */
public class Student_DAO<T> extends AbstractDao<T> {
    
    public List<Student> GetStudentById(String studentId) {
        Query query = session.createQuery("SELECT p from Student p WHERE p.studentId=:studentId ");
        query.setString("studentId", studentId);
        List<Student> pList = query.getResultList();
        return pList;
    }
    
    public List<Student> GetAllStudents() {
        Query query = session.createQuery("SELECT p from Student p ORDER BY p.studentId");
        List<Student> pList = query.getResultList();
        return pList;
    }
    
}
