/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.college.project.bean;

/**
 *
 * @author HOME
 */
public class registration {
    private String enroll;
    private String name;
    private int semester;
    private String email;
    private String password;
    private String college;
    private String city;

     public registration() {
    }

    public registration(String enroll, String name, int semester, String email, String password, String college, String city) {
        this.enroll = enroll;
        this.name = name;
        this.semester = semester;
        this.email = email;
        this.password = password;
        this.college = college;
        this.city = city;
    }
     
    public String getEnroll() {
        return enroll;
    }

    public void setEnroll(String enroll) {
        this.enroll = enroll;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "registration{" + "enroll=" + enroll + ", name=" + name + ", semester=" + semester + ", email=" + email + ", password=" + password + ", college=" + college + ", city=" + city + '}';
    }

   
}
