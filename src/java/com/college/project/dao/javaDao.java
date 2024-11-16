/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.college.project.dao;

import com.college.project.bean.InsertJavaQuestion;
import com.college.project.util.ConnectionPool;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HOME
 */
public class javaDao {
    static Connection conn;
    public int addJava(InsertJavaQuestion jq){
        String sql="insert into questions values ('"+jq.getId()+"','"+jq.getQuestion()+"','"+jq.getOption1()+"','"+jq.getOption2()+"','"+jq.getOption3()+"','"+jq.getOption4()+"','"+jq.getCorrect_answer()+"')";
        Statement stmt;
        int r=0;
        
        try {
            conn = ConnectionPool.connectDB();
            stmt =conn.createStatement();
            r=stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(javaDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
         
        return r;
    }
    
    
//    =========================================================================================================
    
    public InsertJavaQuestion getQuizQuestionById(int id) throws SQLException {
        InsertJavaQuestion quizQuestion = null;
        String query = "SELECT * FROM questions WHERE id = " + id; // SQL query with ID directly concatenated
        
        // Establish a connection to the database
        try {
             conn = ConnectionPool.connectDB();
        Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query); // Execute the query
            
            // Check if the result set has a row (i.e., a question with the given ID exists)
            if (rs.next()) {
                // Create a QuizQuestion object with the result data
                quizQuestion = new InsertJavaQuestion(
                    rs.getInt("id"),               // ID of the question
                    rs.getString("question"),      // The question text
                    rs.getString("option1"),       // Option 1
                    rs.getString("option2"),       // Option 2
                    rs.getString("option3"),       // Option 3
                    rs.getString("option4"),       // Option 4
                    rs.getString("correct_answer") // Correct answer
                );
            }
             } catch (SQLException ex) {
            Logger.getLogger(javaDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        
        return quizQuestion; // Return the quiz question object (or null if not found)
    }

    // Method to establish a connection to the database (replace with your DB connection details)
   
//    =================================ligon==========================================================
    
     public InsertJavaQuestion CheckQuestion(int id){
        conn=ConnectionPool.connectDB();
        InsertJavaQuestion jq=new InsertJavaQuestion();
        String sql="select * from questions where id='"+id+"'";
        try {
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()){
               jq.setId(rs.getInt("id"));
               jq.setQuestion(rs.getString("question"));
               jq.setOption1(rs.getString("option1"));
               jq.setOption2(rs.getString("option2"));
             jq.setOption3(rs.getString("option3"));
              jq.setOption4(rs.getString("option4"));
             jq.setCorrect_answer(rs.getString("Correct_answer"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(javaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jq;
    }
     
     
//     ==============================================================================================================
     
     
     public List<InsertJavaQuestion> getAllQuizQuestions()  {
        List<InsertJavaQuestion> quizQuestions = new ArrayList<>();
        String query = "SELECT * FROM questions";
         conn=ConnectionPool.connectDB();
         
             
            try {
                Statement stmt = conn.createStatement();
                 ResultSet rs=stmt.executeQuery(query);
            while (rs.next()) {
                quizQuestions.add(new InsertJavaQuestion(rs.getInt("id"), rs.getString("question"),
                        rs.getString("option1"), rs.getString("option2"),
                        rs.getString("option3"), rs.getString("option4"),
                        rs.getString("correct_answer")));
            }
            } catch (SQLException ex) {
                Logger.getLogger(javaDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        
             
        return quizQuestions;
    }

     
//     ==============================================================================================================
     
    public void updateQuizQuestion(InsertJavaQuestion quizQuestion) throws SQLException {
    // Construct the SQL query by concatenating the values directly
    String query = "UPDATE questions SET " +
                   "question = '" + quizQuestion.getQuestion() + "', " +
                   "option1 = '" + quizQuestion.getOption1() + "', " +
                   "option2 = '" + quizQuestion.getOption2() + "', " +
                   "option3 = '" + quizQuestion.getOption3() + "', " +
                   "option4 = '" + quizQuestion.getOption4() + "', " +
                   "correct_answer = '" + quizQuestion.getCorrect_answer() + "' " +
                   "WHERE id = " + quizQuestion.getId();

    // Use Statement instead of PreparedStatement
    conn=ConnectionPool.connectDB();
  
         Statement stmt = conn.createStatement();
        // Execute the SQL update query
        stmt.executeUpdate(query);
    
    
}
      
//      =====================================================================================================
       
    public void deleteQuizQuestion(int id) throws SQLException {
    // Construct the SQL query by concatenating the ID directly
    String query = "DELETE FROM questions WHERE id = " + id;

    // Use Statement instead of PreparedStatement
    conn=ConnectionPool.connectDB();
    try (
         Statement stmt = conn.createStatement()) {
        // Execute the SQL delete query
        stmt.executeUpdate(query);
    }
}
    
    
    
//    ======================================================================================================
    
   public boolean isAnswerCorrect(int questionId, int selectedOption) {
        boolean isCorrect = false;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Get a connection from the ConnectionPool
            conn = ConnectionPool.connectDB();

            // SQL query to get the correct option for the question
            String query = "SELECT correct_answer FROM questions WHERE id = " + questionId;

            // Use Statement to execute the query
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            if (rs.next()) {
                int correctOption = rs.getInt("correct_answer");
                // Check if the selected option is the correct answer
                isCorrect = (correctOption == selectedOption);
            }

        } catch (SQLException e) {
            Logger.getLogger(javaDao.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            // Close resources to prevent memory leaks
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return isCorrect;
    }
//        ================================================FIND BY ID========================================================
        
//         public InsertJavaQuestion findById(int id) {
//        conn = ConnectionPool.connectDB(); //step1,step2
//        //step3 :Write SQL Query
//        String sql = "select * from java where id='"+id+"'";
//        InsertJavaQuestion jq = new InsertJavaQuestion();
//        try {
//            //step4: Create Object of Statement
//            Statement stmt = conn.createStatement();
//            //step5: call executeQuery
//            ResultSet rs = stmt.executeQuery(sql);
//            //step6: Process Result
//            while (rs.next()) {
//
//                //System.out.println(""+rs.getInt("id")+"\t"+rs.getString("name")+"\t"+rs.getString("enroll")+"\t"+rs.getFloat("per"));
//                jq.setId(rs.getInt("id"));
//                jq.setQuestion(rs.getString("question"));
//                jq.setAnswer(rs.getString("Answer"));
//                
//            }
//            //step7: Close the Connections
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(javaDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return jq;
//    }
//     

//    
    public static void main(String[] args) throws SQLException{
     InsertJavaQuestion jq=new InsertJavaQuestion();
     javaDao jd=new javaDao();
     
//     ====================================INSERT DATA==============================================================
//     jq.setId(3);
//     jq.setQuestion("What is the size of the int data type in Java?");
//    jq.setOption1("8 bits");
//    jq.setOption2("16 bits");
//    jq.setOption3("32 bits");
//    jq.setOption4("64 bits");
//    jq.setCorrect_answer("32 bits");
//     int r=jd.addJava(jq);
//     if(r>0){
//         System.out.println("Insert  Success");
//     }
//     else{
//         System.out.println("Insert Fail");
//     }
//       
//     
     
//    ======================================CHECK QUESTION by id=========================================================== 
//      System.out.println(jd.CheckQuestion(5));
     
      
//      =====================================================================================================

   InsertJavaQuestion quizQuestion = jd.getQuizQuestionById(1); // Use ID 1 as an example

            // Check if the question was found
            if (quizQuestion != null) {
                // Print the quiz question details
                System.out.println("Question ID: " + quizQuestion.getId());
                System.out.println("Question: " + quizQuestion.getQuestion());
                System.out.println("Option 1: " + quizQuestion.getOption1());
                System.out.println("Option 2: " + quizQuestion.getOption2());
                System.out.println("Option 3: " + quizQuestion.getOption3());
                System.out.println("Option 4: " + quizQuestion.getOption4());
                System.out.println("Correct Option: " + quizQuestion.getCorrect_answer());
            } else {
                System.out.println("No question found with the given ID.");
            }
            

     

//================================================================================================================
//        InsertJavaQuestion quizQuestion = new  InsertJavaQuestion(1, "What is Java?", 
//                                                     "A programming language", 
//                                                     "A coffee", 
//                                                     "A country", 
//                                                     "A framework", 
//                                                     "2");
//
//
//        jd.updateQuizQuestion(quizQuestion);


//==============================================Delete=====================================================

//jd.deleteQuizQuestion(21);

//==========================================FIND ALL=========================================================================
//    List< InsertJavaQuestion> quizQuestions = jd.getAllQuizQuestions();
//            
//            // Print each question
//            for ( InsertJavaQuestion question : quizQuestions) {
//                System.out.println("Question ID: " + question.getId());
//                System.out.println("Question: " + question.getQuestion());
//                System.out.println("Option 1: " + question.getOption1());
//                System.out.println("Option 2: " + question.getOption2());
//                System.out.println("Option 3: " + question.getOption3());
//                System.out.println("Option 4: " + question.getOption4());
//                System.out.println("Correct Answer: " + question.getCorrect_answer());
//                System.out.println("------------------------------");
//            }

    }
    
}
