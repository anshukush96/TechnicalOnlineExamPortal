<%-- 
    Document   : homeadmin
    Created on : Nov 13, 2024, 10:30:46 AM
    Author     : HOME
--%>

<%@page import="com.college.project.bean.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="HomeCss.css">
        <style>
            
        </style>
    </head>
    <body>
        <%
            registration rg = (registration) session.getAttribute("res");
%>

        <h1 id="logo">
       
        <span class="div">
             <img
          src="https://static.thenounproject.com/png/7107415-84.png"
          alt="Logo"
          
          width="55"
          height="55"
          class="d-inline-block align-text-top"
        />
          <strong class="logo1">TechQiz</strong>
           
      </span>
            <h1 class="logo2" align="right">Welcome : <%=rg.getEnroll()%> </h1>
      </h1>
        
    


  <p class=" links"><a href="admin.html">Add Questions</a> <a href="about.html">About Us</a>  <a href="Login.jsp">login </a>     <a href="home.jsp">home page </a>    </p>


         
<!--        <div class="main">-->
   
<header>
    <h1>Technical Online Examination Portal</h1>
    <p>CHOOSE A CATEGORY</p>
  </header>

<div class="category-container-main">
               
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
<!--      <div class="category">
        <a href="Cplus.jsp"><img src="mouse.svg" alt=""></a>
        <p>SQL</p>
      </div>-->
      
     
     
      
     
      
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
