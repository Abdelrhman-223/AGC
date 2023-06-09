package com.modern.www._1_2_MySql_DB_entities;
// Generated May 25, 2021 8:15:13 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * StudentCoursesId generated by hbm2java
 */
@Embeddable
public class StudentCoursesId  implements java.io.Serializable {


     private int studentId;
     private String courseCode;

    public StudentCoursesId() {
    }

    public StudentCoursesId(int studentId, String courseCode) {
       this.studentId = studentId;
       this.courseCode = courseCode;
    }
   


    @Column(name="student_id", nullable=false)
    public int getStudentId() {
        return this.studentId;
    }
    
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }


    @Column(name="course_code", nullable=false, length=45)
    public String getCourseCode() {
        return this.courseCode;
    }
    
    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof StudentCoursesId) ) return false;
		 StudentCoursesId castOther = ( StudentCoursesId ) other; 
         
		 return (this.getStudentId()==castOther.getStudentId())
 && ( (this.getCourseCode()==castOther.getCourseCode()) || ( this.getCourseCode()!=null && castOther.getCourseCode()!=null && this.getCourseCode().equals(castOther.getCourseCode()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getStudentId();
         result = 37 * result + ( getCourseCode() == null ? 0 : this.getCourseCode().hashCode() );
         return result;
   }   


}


