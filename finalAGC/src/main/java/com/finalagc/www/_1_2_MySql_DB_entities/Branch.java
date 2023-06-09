package com.finalagc.www._1_2_MySql_DB_entities;
// Generated May 19, 2023 7:19:39 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Branch generated by hbm2java
 */
@Entity
@Table(name="branch"
    ,catalog="agc_db"
)
public class Branch  implements java.io.Serializable {


     private Integer branchId;
     private String brancheName;
     private Set<BranchDays> branchDayses = new HashSet<BranchDays>(0);
     private Set<Employee> employees = new HashSet<Employee>(0);
     private Set<VisitBranch> visitBranches = new HashSet<VisitBranch>(0);
     private Set<BranchPhoneNumbers> branchPhoneNumberses = new HashSet<BranchPhoneNumbers>(0);
     private Set<BranchAddress> branchAddresses = new HashSet<BranchAddress>(0);
     private Set<Corners> cornerses = new HashSet<Corners>(0);

    public Branch() {
    }

	
    public Branch(String brancheName) {
        this.brancheName = brancheName;
    }
    public Branch(String brancheName, Set<BranchDays> branchDayses, Set<Employee> employees, Set<VisitBranch> visitBranches, Set<BranchPhoneNumbers> branchPhoneNumberses, Set<BranchAddress> branchAddresses, Set<Corners> cornerses) {
       this.brancheName = brancheName;
       this.branchDayses = branchDayses;
       this.employees = employees;
       this.visitBranches = visitBranches;
       this.branchPhoneNumberses = branchPhoneNumberses;
       this.branchAddresses = branchAddresses;
       this.cornerses = cornerses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="Branch_ID", unique=true, nullable=false)
    public Integer getBranchId() {
        return this.branchId;
    }
    
    public void setBranchId(Integer branchId) {
        this.branchId = branchId;
    }

    
    @Column(name="Branche_name", nullable=false, length=45)
    public String getBrancheName() {
        return this.brancheName;
    }
    
    public void setBrancheName(String brancheName) {
        this.brancheName = brancheName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="branch")
    public Set<BranchDays> getBranchDayses() {
        return this.branchDayses;
    }
    
    public void setBranchDayses(Set<BranchDays> branchDayses) {
        this.branchDayses = branchDayses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="branch")
    public Set<Employee> getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="branch")
    public Set<VisitBranch> getVisitBranches() {
        return this.visitBranches;
    }
    
    public void setVisitBranches(Set<VisitBranch> visitBranches) {
        this.visitBranches = visitBranches;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="branch")
    public Set<BranchPhoneNumbers> getBranchPhoneNumberses() {
        return this.branchPhoneNumberses;
    }
    
    public void setBranchPhoneNumberses(Set<BranchPhoneNumbers> branchPhoneNumberses) {
        this.branchPhoneNumberses = branchPhoneNumberses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="branch")
    public Set<BranchAddress> getBranchAddresses() {
        return this.branchAddresses;
    }
    
    public void setBranchAddresses(Set<BranchAddress> branchAddresses) {
        this.branchAddresses = branchAddresses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="branch")
    public Set<Corners> getCornerses() {
        return this.cornerses;
    }
    
    public void setCornerses(Set<Corners> cornerses) {
        this.cornerses = cornerses;
    }




}


