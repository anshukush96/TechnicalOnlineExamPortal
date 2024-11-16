/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.college.operation;

import com.college.project.bean.InsertJavaQuestion;
import com.college.project.dao.javaDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/quizNavigation")
public class CheckAnswerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Get the current question index from the session (initialize to 1 if not present)
        int currentIndex = session.getAttribute("currentIndex") != null ? 
                (int) session.getAttribute("currentIndex") : 1;

        // Handle form submission
        String selectedOption = request.getParameter("answer");
        int questionId = Integer.parseInt(request.getParameter("questionId"));

        javaDao jd = new javaDao();

        try {
            // Store user's answer in session
            String[] userAnswers = (String[]) session.getAttribute("userAnswers");
            userAnswers[currentIndex - 1] = selectedOption;  // Store the answer

            // Handle "Next" or "Previous" button click
            String action1 = request.getParameter("action");
          if ("Next".equals(action1)) {
            currentIndex++; // Move to the next question
        } else if ("Previous".equals(action1) && currentIndex > 1) {
            currentIndex--; // Move to the previous question
        }

            // Update the session with the new index and user answers
            session.setAttribute("currentIndex", currentIndex);

        // Fetch the question for the updated index
        
        InsertJavaQuestion ques = jd.CheckQuestion(currentIndex);
        request.setAttribute("ques", ques);

            // Redirect to the same JSP page to display the next question
            request.getRequestDispatcher("Java.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing quiz");
        }
    }
}
