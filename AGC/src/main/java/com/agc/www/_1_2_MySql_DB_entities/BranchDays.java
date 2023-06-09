package com.agc.www._1_2_MySql_DB_entities;
// Generated May 17, 2023 11:14:37 AM by Hibernate Tools 4.3.1


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * BranchDays generated by hbm2java
 */
@Entity
@Table(name="branch_days"
    ,catalog="agc_db"
)
public class BranchDays  implements java.io.Serializable {


     private BranchDaysId id;
     private Branch branch;

    public BranchDays() {
    }

    public BranchDays(BranchDaysId id, Branch branch) {
       this.id = id;
       this.branch = branch;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="branchId", column=@Column(name="Branch_ID", nullable=false) ), 
        @AttributeOverride(name="day", column=@Column(name="day", nullable=false, length=20) ) } )
    public BranchDaysId getId() {
        return this.id;
    }
    
    public void setId(BranchDaysId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="Branch_ID", nullable=false, insertable=false, updatable=false)
    public Branch getBranch() {
        return this.branch;
    }
    
    public void setBranch(Branch branch) {
        this.branch = branch;
    }




}


