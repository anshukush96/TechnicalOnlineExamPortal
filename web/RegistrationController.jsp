<%-- 
    Document   : Registration.jsp
    Created on : Sep 10, 2024, 2:28:56 PM
    Author     : HOME
--%>

<%@page import="com.college.project.dao.registrationDao"%>
<%@page import="com.college.project.bean.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .acccont{
              height: 450px;
             width: 300px;
             margin-top: 100px;
             margin-left:450px; 
             
             color: white;
              padding-top: 100px;
             padding-left: 180px;
              background-image: url("https://media.istockphoto.com/id/1497285758/vector/abstract-dark-blue-blurred-defocused-gradient-background.jpg?s=1024x1024&w=is&k=20&c=8VauXSB-QByqTeUkLfCNoF0ijgH44iBGoYjGYDEiWyU=")
            }
            .acccont a{
                text-decoration: none;
                color: white;
               
                font-size: 35px;
            }
        </style>
    </head>
    <body>
       <%
           String str="";
           if(request.getParameter("enroll")!=null && request.getParameter("nm")!=null && request.getParameter("email")!=null && request.getParameter("sem")!=null && request.getParameter("ps")!=null && request.getParameter("ct")!=null && request.getParameter("clg")!=null){
       String enroll=request.getParameter("enroll");
       String name=request.getParameter("nm");
       String email =request.getParameter("email");
       String city=request.getParameter("ct");
       String password=request.getParameter("ps");
        String college=request.getParameter("clg");
        int semester =Integer.parseInt(request.getParameter("sem"));

        registration rg=new registration();
        rg.setEnroll(enroll);
        rg.setName(name);
        rg.setEmail(email);
        rg.setSemester(semester);
        rg.setPassword(password);
        rg.setCollege(college);
        rg.setCity(city);
       registrationDao rd=new registrationDao();
        int r=rd.addRegistration(rg);
        
        if(r>0){
            str="Account create Success";
//            response.sendRedirect("LoginPage.jsp");
        }
           }
       %>
<!--       <div class="acccont">-->
           
           <h1><%= str%></h1><br>
       <h2><a href="./LoginPage.jsp">Login here</a></h2>
      
       <!--</div>-->
       
     
    </body>
</html>