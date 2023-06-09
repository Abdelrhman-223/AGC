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
 * EmployeeAddress generated by hbm2java
 */
@Entity
@Table(name="employee_address"
    ,catalog="agc_db"
)
public class EmployeeAddress  implements java.io.Serializable {


     private Integer employeeAddressId;
     private Employee employee;
     private String street;
     private String city;

    public EmployeeAddress() {
    }

    public EmployeeAddress(Employee employee, String street, String city) {
       this.employee = employee;
       this.street = street;
       this.city = city;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="employee_address_id", unique=true, nullable=false)
    public Integer getEmployeeAddressId() {
        return this.employeeAddressId;
    }
    
    public void setEmployeeAddressId(Integer employeeAddressId) {
        this.employeeAddressId = employeeAddressId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="EmployeeID", nullable=false)
    public Employee getEmployee() {
        return this.employee;
    }
    
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    
    @Column(name="Street", nullable=false, length=50)
    public String getStreet() {
        return this.street;
    }
    
    public void setStreet(String street) {
        this.street = street;
    }

    
    @Column(name="City", nullable=false, length=45)
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }




}


