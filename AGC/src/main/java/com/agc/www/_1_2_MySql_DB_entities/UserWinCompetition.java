package com.agc.www._1_2_MySql_DB_entities;
// Generated May 17, 2023 11:14:37 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * UserWinCompetition generated by hbm2java
 */
@Entity
@Table(name="user_win_competition"
    ,catalog="agc_db"
)
public class UserWinCompetition  implements java.io.Serializable {


     private int winnerId;
     private Competition competition;
     private User user;
     private int rank;

    public UserWinCompetition() {
    }

    public UserWinCompetition(int winnerId, Competition competition, User user, int rank) {
       this.winnerId = winnerId;
       this.competition = competition;
       this.user = user;
       this.rank = rank;
    }
   
     @Id 

    
    @Column(name="winner_id", unique=true, nullable=false)
    public int getWinnerId() {
        return this.winnerId;
    }
    
    public void setWinnerId(int winnerId) {
        this.winnerId = winnerId;
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

    
    @Column(name="Rank", nullable=false)
    public int getRank() {
        return this.rank;
    }
    
    public void setRank(int rank) {
        this.rank = rank;
    }




}


