<%-- 
    Document   : home.jsp
    Created on : Oct 23, 2024, 9:45:46 PM
    Author     : HOME
--%>

<%@page import="com.college.project.bean.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="homeCss.css">
        <style>
            
        </style>
    </head>
    <body>
        <%
            registration rg = (registration) session.getAttribute("res");
%>

       <h1 id="logo">
      <span class="div">
<!--             <img
          src="https://static.thenounproject.com/png/7107415-84.png"
          alt="Logo"
          id="img"
          width="55"
          height="55"
          class="d-inline-block align-text-top"
        />-->
          <strong>TechQiz</strong>
           
      </span>
      </h1>
  <header>
      
    <h1>Technical Online Examination Portal</h1>
  </header>

  
    <nav class="links">
    <ul>
      <!--<li><a href="#">Contact Us</a></li>-->
      <li><a href="Registration.jsp">Register</a></li>
      <li><a href="Login.jsp">Login</a></li>
       <li><a href="about.html">About Us</a></li>
      <li><a href="home.jsp">Home</a></li>
    </ul>
  </nav>

         
<!--        <div class="main">-->
   
<!--<header>
    <h1>Technical Online Examination Portal</h1>
    <p>CHOOSE A CATEGORY</p>
  </header>-->

      <h2 class="logo2" align="right">Welcome : <%=rg.getEnroll()%> </h2>
               
    <div class="category-container">
     <div class="category">
       <a href="C.jsp"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq4FK-H-yNLJB0yOZxJ9y9OW6o9JCouaM-rw&s" alt=""></a>
        <p>C</p>
      </div>
      <div class="category">
          <a href="Cplus.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS83EQ2Mjvdgj0POZKKsQQvuij9OxTBeCGtfQ&s" alt=""></a>
        <p>C++</p>
      </div>
      
      <div class="category">
        <a href="Java.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5AdbWhn5gZ3xYRW2vItwAICDW9DnYPGvgEQ&s" alt=""></a>
        <p>Java</p>
      </div>
      <div class="category">
        <a href="Python.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTynyV3e_loEfqxnU9-km88jNPKu0XsNRclAQ&s" alt=""></a>
        <p>Python</p>
      </div>
      
     
      <div class="category">
        <a href="Sql.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoHQNtSP8cffEfWLCL-oFuo6wX7Wb-rfoK3Q&s" alt=""></a>
        <p>SQL</p>
      </div>
      <div class="category">
       <a href="Html.jsp"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/800px-HTML5_logo_and_wordmark.svg.png" alt=""></a>
        <p>HTML</p>
      </div>
      <div class="category">
       <a href="Css.jsp"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfkMYb955fj7IRiw-8g6gmn5GoZzKni1Kv8g&s" alt=""></a>
        <p>CSS</p>
      </div>

      <div class="category">
        <a href="JavaScript.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz41cPuVdAr6Pam-0w4kWHSMIBBlbta3liTg&s" alt=""></a>
        <p>JavaScript</p>
      </div>
      <div class="category">
        <a href="React.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHgfPMsXVZxNrRN_J58e89mkWiUZ7mPahC6A&s" alt=""></a>
        <p>React</p>
        
      </div>
      <div class="category">
        <a href="more.jsp"><img src="data:image/png;base64,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" alt=""></a>
        <p>more</p>
      </div>
     
     
     
      
     
      
    </div>
 
  <br>
<br>
  <footer>
    <p>&copy; 2024 Technical Online Exam Portal</p>
  </footer>
        <!--</div>-->
    </body>
</html>
