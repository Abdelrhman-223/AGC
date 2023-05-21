package com.finalagc.www._1_2_MySql_DB_entities;
// Generated May 19, 2023 7:19:39 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * BranchPhoneNumbers generated by hbm2java
 */
@Entity
@Table(name="branch_phone_numbers"
    ,catalog="agc_db"
)
public class BranchPhoneNumbers  implements java.io.Serializable {


     private int branchPhoneNumber;
     private Branch branch;

    public BranchPhoneNumbers() {
    }

    public BranchPhoneNumbers(int branchPhoneNumber, Branch branch) {
       this.branchPhoneNumber = branchPhoneNumber;
       this.branch = branch;
    }
   
     @Id 

    
    @Column(name="Branch_Phone_Number", unique=true, nullable=false)
    public int getBranchPhoneNumber() {
        return this.branchPhoneNumber;
    }
    
    public void setBranchPhoneNumber(int branchPhoneNumber) {
        this.branchPhoneNumber = branchPhoneNumber;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="Branch_ID", nullable=false)
    public Branch getBranch() {
        return this.branch;
    }
    
    public void setBranch(Branch branch) {
        this.branch = branch;
    }




}

