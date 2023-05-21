package com.finalagc.www._1_2_MySql_DB_entities;
// Generated May 19, 2023 7:19:39 AM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * LsLifted generated by hbm2java
 */
@Entity
@Table(name="ls_lifted"
    ,catalog="agc_db"
    , uniqueConstraints = @UniqueConstraint(columnNames="Lifted_reason") 
)
public class LsLifted  implements java.io.Serializable {


     private Integer lsLiftedId;
     private Machine machine;
     private Date liftedData;
     private String liftedReason;

    public LsLifted() {
    }

    public LsLifted(Machine machine, Date liftedData, String liftedReason) {
       this.machine = machine;
       this.liftedData = liftedData;
       this.liftedReason = liftedReason;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ls_lifted_id", unique=true, nullable=false)
    public Integer getLsLiftedId() {
        return this.lsLiftedId;
    }
    
    public void setLsLiftedId(Integer lsLiftedId) {
        this.lsLiftedId = lsLiftedId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="Machine_ID", nullable=false)
    public Machine getMachine() {
        return this.machine;
    }
    
    public void setMachine(Machine machine) {
        this.machine = machine;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="Lifted_Data", nullable=false, length=10)
    public Date getLiftedData() {
        return this.liftedData;
    }
    
    public void setLiftedData(Date liftedData) {
        this.liftedData = liftedData;
    }

    
    @Column(name="Lifted_reason", unique=true, nullable=false, length=250)
    public String getLiftedReason() {
        return this.liftedReason;
    }
    
    public void setLiftedReason(String liftedReason) {
        this.liftedReason = liftedReason;
    }




}


