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
 * JoinedUser generated by hbm2java
 */
@Entity
@Table(name="joined_user"
    ,catalog="agc_db"
)
public class JoinedUser  implements java.io.Serializable {


     private int joinedUserId;
     private Competition competition;
     private User user;
     private Date joinDate;

    public JoinedUser() {
    }

	
    public JoinedUser(int joinedUserId, Competition competition, User user) {
        this.joinedUserId = joinedUserId;
        this.competition = competition;
        this.user = user;
    }
    public JoinedUser(int joinedUserId, Competition competition, User user, Date joinDate) {
       this.joinedUserId = joinedUserId;
       this.competition = competition;
       this.user = user;
       this.joinDate = joinDate;
    }
   
     @Id 

    
    @Column(name="joined_user_id", unique=true, nullable=false)
    public int getJoinedUserId() {
        return this.joinedUserId;
    }
    
    public void setJoinedUserId(int joinedUserId) {
        this.joinedUserId = joinedUserId;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="Competition_Id", nullable=false)
    public Competition getCompetition() {
        return this.competition;
    }
    
    public void setCompetition(Competition competition) {
        this.competition = competition;
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
    @Column(name="Join_Date", length=19)
    public Date getJoinDate() {
        return this.joinDate;
    }
    
    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }




}


