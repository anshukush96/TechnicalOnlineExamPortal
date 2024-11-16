<%-- 
    Document   : Python.jsp
    Created on : Oct 23, 2024, 10:03:34 PM
    Author     : HOME
--%>

<%@page import="com.college.project.dao.PythonDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.college.project.bean.InsertJavaQuestion"%>
<%@page import="com.college.project.bean.registration"%>
<%@page import="com.college.project.dao.javaDao"%>
<%@page import="com.college.project.dao.registrationDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <style>
           
            .div{
                display: flex;
                justify-content: space-around;
            }
            .div a{
                text-decoration: none;
                color: black;
            }
            .login{
                background-repeat: no-repeat;
                border: 2px solid pink;
                height: 700px;
                /*                width: 550px;*/
                display: flex;
                border-radius: 10px;
                margin-top: 0px;
                /*               margin-left: 470px;*/
                justify-content: center;
                align-items: center;
               padding-left: 60px;
                background-size: cover;
                background-image: url("https://i.pinimg.com/originals/9e/aa/b0/9eaab0db56bb4571f47994255afbc971.jpg");  
            }
            .loginform tr td {
                font-size: 25px;
                color: black;

            }
            .loginform  input{
                font-size: 20px;
                margin: 15px;

                height: 30px;
                border-radius: 10px; 
            }
            .button{
                background-color: black ;   
                font-size: 20px;
                margin: 15px;
                color: white;
                padding: 10px;

                width: 150px;
                border-radius: 10px; 
            }
            .right{
                padding-right: 50px;
                color: #4682B4;

            }
            .del{
                margin-top: -50px;
                margin-right: 50px;
            }
            #ques{
                color: white;
                width: 300px;
              padding: 50px;
               border: solid #FFA500 5px ;
               border-radius: 80px;
              
            }
            #option{
                 color: white;
              padding: 10px;
              margin: 30px;
              margin-top: 40px;
               border: solid #FF8C00 5px ;
               border-radius: 80px;
              
            }
            #option1{
                 color: white;
              padding: 10px;
              margin: 30px;
              margin-top: 40px;
               border: solid #FF8C00 5px ;
               border-radius: 80px;
             
             
            }
            #option2{
                color: white;
              padding: 10px;
              margin: 30px;
              margin-top: 40px;
               border: solid #FF8C00 5px ;
               border-radius: 80px;
            }
            #option3{
                  color: white;
              padding: 10px;
              margin: 30px;
              margin-top: 40px;
               border: solid #FF8C00 5px ;
               border-radius: 80px;
            }
        </style>-->
<link rel="stylesheet" href="Javacss.css">
        <script>
      <%
      String clock = request.getParameter("clock");
      if(clock == null)
    	  clock = "30";
      %>
      var timeout = <%=clock %>
      function timer()
      {
    	  if( timeout > 0)
    		  {
    		  timeout--;
    		  document.forma.clock.value ="Time Over";
    	      document.forma.clock.value = timeout;
    		  window.setTimeout("timer()", 1000 );
    		  }
    	  else
    		  {
    		  document.forma.clock.value ="Time Over";
    		  formb.submit();
                                    document.getElementById("action").value = "Next";
                                   document.getElementById("quizForm").submit();
                                   
    		  }
      }
      
//      function startCamera() {
//                navigator.mediaDevices.getUserMedia({ video: true })
//                    .then(function (stream) {
//                        var video = document.getElementById("cameraFeed");
//                        video.srcObject = stream;
//                        video.play();
//                    })
//                    .catch(function (err) {
//                        console.error("Error accessing the camera: ", err);
//                        alert("Camera access is required for this quiz.");
//                    });
//            }
//            


let cameraStream;

            function startCamera() {
                navigator.mediaDevices.getUserMedia({ video: true })
                    .then(function (stream) {
                        // Display the camera feed
                        const video = document.getElementById("cameraFeed");
                        video.srcObject = stream;
                        video.play();
                        cameraStream = stream; // Save the stream to stop it later
                    })
                    .catch(function (err) {
                        console.error("Error accessing the camera: ", err);
                        alert("Camera access is required for this quiz.");
                    });
            }

            function stopCamera() {
                if (cameraStream) {
                    // Stop all tracks of the stream
                    cameraStream.getTracks().forEach(track => track.stop());
                    console.log("Camera turned off.");
                }
            }

            // Stop the camera on form submit
            document.addEventListener("DOMContentLoaded", function() {
                const form = document.getElementById("quizForm");
                if (form) {
                    form.addEventListener("submit", stopCamera);
                }
            });

            // Stop the camera when the page is about to unload
            window.onbeforeunload = function () {
                stopCamera();
            };


      </script>
    </head>
    <body onload="timer(); startCamera();">
         <form name="forma" align="right" class="time" action="<%=request.getRequestURL()%>">

     <font>Time Left <input size="4" name="clock" id="fno" value="<%=clock%>" style="background: #ffcdd2" readonly></font>
  
    </form>
     
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
    <%
    // Retrieve the selected answer and question ID from the request
    String answerParam = request.getParameter("answer");
    String questionIdParam = request.getParameter("questionId");
      int finalscore=0;
      String Option=null;
 
    // Check if the parameters are valid
    if (answerParam != null && questionIdParam != null) {
        try {
            // Parse the answer and question ID
            int selectedOption = Integer.parseInt(answerParam);
            int questionId = Integer.parseInt(questionIdParam);

            // Create an instance of your DAO class
            PythonDao dao = new PythonDao();

            // Check if the answer is correct
            boolean isCorrect = dao.isAnswerCorrect(questionId, selectedOption);

            // Optionally, save the result in session or database (Example for session)
            session.setAttribute("isCorrect", isCorrect);
           
            out.println("Question ID: " + questionId);
//            out.println("Selected Option: " + selectedOption);
//            out.println("Is Answer Correct: " + isCorrect);
            
             Integer score = (Integer) session.getAttribute("score");
    
    if (score == null) {
        score = 0;  // Set score to 0 at the beginning
        session.setAttribute("score", score);
    }

            // Update the score if the answer is correct
            if (isCorrect) {
                score++;
                session.setAttribute("score", score);  // Update session score
                 Option="You Chose Correct Option";
                 finalscore=score;
            }
            else{
                Option="You Chose Incorrect Option";
            }

            // Display the score and feedback
//            out.println("Your current score: " + score);
            
//            out.println("Is Answer Correct: " + isCorrect);
             
                 


        } catch (NumberFormatException e) {
            out.println("Invalid number format for answer or question ID.");
        }
    } else {
        out.println("Please select an answer.");
    }
%>
      <%
    // Fetch the current question index from the session
 int currentIndex = session.getAttribute("currentIndex") != null ?
            (int) session.getAttribute("currentIndex") : 1;


    // Check if the "Next" button was pressed
    String action = request.getParameter("action");
    if ("Next".equals(action)) {
        currentIndex++;
    }
    else if("Previous".equals(action)){
        currentIndex--;
    }
    

    // Save the updated index in the session
    session.setAttribute("currentIndex", currentIndex);

    // Get the question based on the updated index
    PythonDao jd = new PythonDao();
    InsertJavaQuestion ques = jd.CheckQuestion(currentIndex);
%>
<div>
           
            <video type="hidden" id="cameraFeed" width="320" height="240" autoplay style="border: 2px solid #000; align-items:flex-end;"></video>
        </div>
      <%
          if(Option!=null){
          %>
          <h3><%=Option%></h3>
          <%
          }
          %>
       
 <div id="score">Final Score <%=finalscore%></div>


<div class="login">
    <form action="Python.jsp" method="post">
       
        <%
            if (ques !=null) {
        %>
        <h2 id="ques">Question <%= currentIndex %>: <%= ques.getQuestion() %></h2>
     
        <!-- Display the options as radio buttons -->
        <input type="hidden" name="questionId" value="<%= ques.getId() %>" />
        <label  id="option"><input type="radio" name="answer" value="1"> <%= ques.getOption1() %></label><br><br><br>
        <label  id="option1"><input type="radio" name="answer" value="2"><%= ques.getOption2() %></label><br><br><br>
        <label  id="option2"><input type="radio" name="answer" value="3"><%= ques.getOption3() %></label><br><br><br>
        <label  id="option3"><input type="radio" name="answer" value="4"><%= ques.getOption4() %></label><br><br><br>

        <!-- Buttons to navigate between questions -->
         <button type="submit" name="action" value="Previous">Previous</button>
        <button type="submit" name="action" value="Next">Next</button>
        <submit type="submit" name="action" value="submit" id="buttonsubmit"><a href="certificate.jsp">Submit</a></submit>
           


        <%
            } else {
        %>
        <p>No question found with the provided ID.</p>
        <%
            }
        %>
    </form>
</div>

    </body>
</html>


