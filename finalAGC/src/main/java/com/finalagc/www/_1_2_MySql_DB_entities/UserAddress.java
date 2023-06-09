package com.finalagc.www._1_2_MySql_DB_entities;
// Generated May 19, 2023 7:19:39 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * UserAddress generated by hbm2java
 */
@Entity
@Table(name="user_address"
    ,catalog="agc_db"
)
public class UserAddress  implements java.io.Serializable {


     private Integer userAddressId;
     private User user;
     private String streat;
     private String city;

    public UserAddress() {
    }

    public UserAddress(User user, String streat, String city) {
       this.user = user;
       this.streat = streat;
       this.city = city;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="user_address_id", unique=true, nullable=false)
    public Integer getUserAddressId() {
        return this.userAddressId;
    }
    
    public void setUserAddressId(Integer userAddressId) {
        this.userAddressId = userAddressId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="UserID", nullable=false)
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    
    @Column(name="Streat", nullable=false, length=60)
    public String getStreat() {
        return this.streat;
    }
    
    public void setStreat(String streat) {
        this.streat = streat;
    }

    
    @Column(name="City", nullable=false, length=45)
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }




}


