package com.agc.www._1_2_MySql_DB_entities;
// Generated May 17, 2023 11:14:37 AM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * VisitBranch generated by hbm2java
 */
@Entity
@Table(name="visit_branch"
    ,catalog="agc_db"
)
public class VisitBranch  implements java.io.Serializable {


     private int visitBranchId;
     private Branch branch;
     private User user;
     private Date timeOfEntry;
     private Date timeOfGo;

    public VisitBranch() {
    }

	
    public VisitBranch(int visitBranchId, Branch branch, User user, Date timeOfEntry) {
        this.visitBranchId = visitBranchId;
        this.branch = branch;
        this.user = user;
        this.timeOfEntry = timeOfEntry;
    }
    public VisitBranch(int visitBranchId, Branch branch, User user, Date timeOfEntry, Date timeOfGo) {
       this.visitBranchId = visitBranchId;
       this.branch = branch;
       this.user = user;
       this.timeOfEntry = timeOfEntry;
       this.timeOfGo = timeOfGo;
    }
   
     @Id 

    
    @Column(name="visit_branch_id", unique=true, nullable=false)
    public int getVisitBranchId() {
        return this.visitBranchId;
    }
    
    public void setVisitBranchId(int visitBranchId) {
        this.visitBranchId = visitBranchId;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="Branch_ID", nullable=false)
    public Branch getBranch() {
        return this.branch;
    }
    
    public void setBranch(Branch branch) {
        this.branch = branch;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="UserID", nullable=false)
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Time_of_entry", nullable=false, length=19)
    public Date getTimeOfEntry() {
        return this.timeOfEntry;
    }
    
    public void setTimeOfEntry(Date timeOfEntry) {
        this.timeOfEntry = timeOfEntry;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Time_of_go", length=19)
    public Date getTimeOfGo() {
        return this.timeOfGo;
    }
    
    public void setTimeOfGo(Date timeOfGo) {
        this.timeOfGo = timeOfGo;
    }




}

