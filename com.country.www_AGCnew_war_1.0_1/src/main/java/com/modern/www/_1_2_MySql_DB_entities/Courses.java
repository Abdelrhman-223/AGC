package com.modern.www._1_2_MySql_DB_entities;
// Generated May 25, 2021 8:15:13 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Courses generated by hbm2java
 */
@Entity
@Table(name="courses"
    ,catalog="world"
)
public class Courses  implements java.io.Serializable {


     private String courseCode;
     private String courseName;
     private Set<StudentCourses> studentCourseses = new HashSet<StudentCourses>(0);

    public Courses() {
    }

	
    public Courses(String courseCode) {
        this.courseCode = courseCode;
    }
    public Courses(String courseCode, String courseName, Set<StudentCourses> studentCourseses) {
       this.courseCode = courseCode;
       this.courseName = courseName;
       this.studentCourseses = studentCourseses;
    }
   
     @Id 

    
    @Column(name="course_code", unique=true, nullable=false, length=45)
    public String getCourseCode() {
        return this.courseCode;
    }
    
    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    
    @Column(name="course_name", length=100)
    public String getCourseName() {
        return this.courseName;
    }
    
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

@OneToMany(fetch=FetchType.EAGER, mappedBy="courses")
    public Set<StudentCourses> getStudentCourseses() {
        return this.studentCourseses;
    }
    
    public void setStudentCourseses(Set<StudentCourses> studentCourseses) {
        this.studentCourseses = studentCourseses;
    }




}


