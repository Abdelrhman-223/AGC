/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.agc.www._1_3_MySql_DB_daos;

import com.agc.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.agc.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.agc.www._1_2_MySql_DB_entities.Employee;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Dell
 */
public class Employee_DAO<T> extends AbstractDao<T> {
    public List<Employee> GetBranchById(String EmployeeID) {
        Query query = session.createQuery("SELECT * from employee e WHERE e.EmployeeID=:EmployeeID");
        query.setString("EmployeeID", EmployeeID);
        List<Employee> pList = query.getResultList();
        return pList;
    }
    
    public List<Employee> GetAllBranchs() {
        Query query = session.createQuery("SELECT * from employee e ORDER BY e.EmployeeID");
        List<Employee> pList = query.getResultList();
        return pList;
    }
}
