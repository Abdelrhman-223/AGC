/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.agc.www._1_3_MySql_DB_daos;

import com.agc.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.agc.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.agc.www._1_2_MySql_DB_entities.Branch;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Dell
 */
public class Branch_DAO<T> extends AbstractDao<T> {
    public List<Branch> GetBranchById(String Branch_Id) {
        Query query = session.createQuery("SELECT * from branch b WHERE b.Branch_Id=:Branch_Id");
        query.setString("Branch_Id", Branch_Id);
        List<Branch> pList = query.getResultList();
        return pList;
    }
    
    public List<Branch> GetAllBranchs() {
        Query query = session.createQuery("SELECT * from branch b ORDER BY b.Branch_Id");
        List<Branch> pList = query.getResultList();
        return pList;
    }
}
