/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.college.project.dao;

/**
 *
 * @author HOME
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Question;

public class QuestionDao {

    public List<Question> getAllQuestions() {
        List<Question> questionList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegeproject", "root", "Anshu");// Assume Database is a class that handles DB connection
            String query = "SELECT * FROM questions";
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("id"));
                question.setQuestion(rs.getString("question"));
                question.setType(rs.getString("type"));
                question.setOption1(rs.getString("option1"));
                question.setOption2(rs.getString("option2"));
                question.setOption3(rs.getString("option3"));
                question.setOption4(rs.getString("option4"));
                question.setCorrectAnswer(rs.getString("correct_answer"));

                questionList.add(question);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return questionList;
    }
}
