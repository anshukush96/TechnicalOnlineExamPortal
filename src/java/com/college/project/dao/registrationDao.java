/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.college.project.dao;

import com.college.project.bean.registration;
import com.college.project.util.ConnectionPool;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HOME
 */
public class registrationDao {
    static Connection conn;
    public int addRegistration(registration rg){
        String sql="insert into registration values ('"+rg.getEnroll()+"','"+rg.getName()+"','"+rg.getSemester()+"','"+rg.getEmail()+"','"+rg.getPassword()+"','"+rg.getCollege()+"','"+rg.getCity()+"')";
        Statement stmt;
        int r=0;
        
        try {
            conn = ConnectionPool.connectDB();
            stmt =conn.createStatement();
            r=stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(registrationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
         
        return r;
    }
    
//    =================================ligon==========================================================
    
     public registration loginCheck(String userName,String password){
        conn=ConnectionPool.connectDB();
        registration rg=new registration();
        String sql="select * from registration where email='"+userName+"' && password='"+password+"'";
        try {
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()){
               rg.setName(rs.getString("name"));
               rg.setSemester(rs.getInt("semester"));
               rg.setEnroll(rs.getString("enroll"));
               rg.setEmail(rs.getString("email"));
               rg.setCity(rs.getString("city"));
               rg.setCollege(rs.getString("college"));
               rg.setPassword(rs.getString("password"));
             
              
             
            }
        } catch (SQLException ex) {
            Logger.getLogger(registrationDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rg;
    }
    
    public static void main(String[] args){
    registration rg=new registration();
     registrationDao rd=new registrationDao();
//     rg.setEnroll("0115CS211016");
//     rg.setName("Anshu");
//     rg.setEmail("anshu@gmail.com");
//     rg.setPassword("Anshu@123");
//     rg.setSemester(7);
//     rg.setCollege("NRI");
//     rg.setCity("Bhopal");
//     
//     int r=rd.addRegistration(rg);
//     if(r>0){
//         System.out.println("Registration Success");
//     }
//     else{
//         System.out.println("Registration Fail");
//     }
       
    registration result = rd.loginCheck("anshu@gmail.com", "Anshu@123");
      System.out.println(result.getName());
        
    
}
}
    

