/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonFiles;

/**
 *
 * @author cdc
 */
public class student_json {
    private String student_id;
    private String student_name;
    private String student_age;

    public student_json(){
        
    }
    public student_json(String student_id, String student_name, String student_age) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.student_age = student_age;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_age() {
        return student_age;
    }

    public void setStudent_age(String student_age) {
        this.student_age = student_age;
    }
    
}
