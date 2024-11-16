<%-- 
    Document   : certificate
    Created on : Nov 15, 2024, 12:36:41 PM
    Author     : HOME
--%>

<%@page import="com.college.project.bean.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="certificateCss.css">
         
         <script>
        // Function to show the popup
        function showPopup() {
            document.getElementById("customPopup").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        }

        function closePopup() {
            document.getElementById("customPopup").style.display = "none";
            document.getElementById("overlay").style.display = "none";
        }
    </script>
         
    </head>
    
    <body onload="showPopup()">
        
        <div id="overlay"></div>
        <div id="customPopup">
        <p>Do You Want To give Feedback</p>
        <a href="feedback.jsp" target="_blank">Click Here for feedback</a>
        <br><br>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
        
        
        
        
         <%
            registration rg = (registration) session.getAttribute("res");
%>

<!--          <h1 class="logo2" align="right">Welcome :  </h1>-->
         <div class="certificate">
        <div class="top-border"></div>
        <div class="content">
            <h1 class="title">CERTIFICATE OF ACHIEVEMENT</h1>
            <p class="recipient">THIS CERTIFICATE IS PRESENTED TO:</p>
            <h2 class="name"><%=rg.getName()%></h2>
            <p class="message">Hopefully this achievement will be the first step towards bigger success.</p>
            <p class="message">Keep trying and give your best.</p>
        </div>
        <div class="bottom-border"></div>
        <div class="signatories">
            <p class="signature">Date: </p>
            <p class="signature">signature</p>
        </div>
    </div>
            <button class="button"><a href="home.jsp">Go for Home page</a></button>
    </body>
</html>
