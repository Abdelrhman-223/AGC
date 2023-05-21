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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Corners generated by hbm2java
 */
@Entity
@Table(name="corners"
    ,catalog="agc_db"
)
public class Corners  implements java.io.Serializable {


     private Integer cornerNumber;
     private Branch branch;
     private String gamesType;
     private String cornerName;
     private int requiredAge;
     private Integer numOfMachines;
     private Integer visitorsNum;
     private Set<Machine> machines = new HashSet<Machine>(0);
     private Set<VisitCorner> visitCorners = new HashSet<VisitCorner>(0);

    public Corners() {
    }

	
    public Corners(Branch branch, String gamesType, String cornerName, int requiredAge) {
        this.branch = branch;
        this.gamesType = gamesType;
        this.cornerName = cornerName;
        this.requiredAge = requiredAge;
    }
    public Corners(Branch branch, String gamesType, String cornerName, int requiredAge, Integer numOfMachines, Integer visitorsNum, Set<Machine> machines, Set<VisitCorner> visitCorners) {
       this.branch = branch;
       this.gamesType = gamesType;
       this.cornerName = cornerName;
       this.requiredAge = requiredAge;
       this.numOfMachines = numOfMachines;
       this.visitorsNum = visitorsNum;
       this.machines = machines;
       this.visitCorners = visitCorners;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="Corner_Number", unique=true, nullable=false)
    public Integer getCornerNumber() {
        return this.cornerNumber;
    }
    
    public void setCornerNumber(Integer cornerNumber) {
        this.cornerNumber = cornerNumber;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="Branch_ID", nullable=false)
    public Branch getBranch() {
        return this.branch;
    }
    
    public void setBranch(Branch branch) {
        this.branch = branch;
    }

    
    @Column(name="Games_type", nullable=false, length=45)
    public String getGamesType() {
        return this.gamesType;
    }
    
    public void setGamesType(String gamesType) {
        this.gamesType = gamesType;
    }

    
    @Column(name="Corner_Name", nullable=false, length=45)
    public String getCornerName() {
        return this.cornerName;
    }
    
    public void setCornerName(String cornerName) {
        this.cornerName = cornerName;
    }

    
    @Column(name="Required_age", nullable=false)
    public int getRequiredAge() {
        return this.requiredAge;
    }
    
    public void setRequiredAge(int requiredAge) {
        this.requiredAge = requiredAge;
    }

    
    @Column(name="Num_of_machines")
    public Integer getNumOfMachines() {
        return this.numOfMachines;
    }
    
    public void setNumOfMachines(Integer numOfMachines) {
        this.numOfMachines = numOfMachines;
    }

    
    @Column(name="visitors_num")
    public Integer getVisitorsNum() {
        return this.visitorsNum;
    }
    
    public void setVisitorsNum(Integer visitorsNum) {
        this.visitorsNum = visitorsNum;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="corners")
    public Set<Machine> getMachines() {
        return this.machines;
    }
    
    public void setMachines(Set<Machine> machines) {
        this.machines = machines;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="corners")
    public Set<VisitCorner> getVisitCorners() {
        return this.visitCorners;
    }
    
    public void setVisitCorners(Set<VisitCorner> visitCorners) {
        this.visitCorners = visitCorners;
    }




}

