<%-- 
    Document   : admin.jsp
    Created on : Nov 13, 2024, 10:28:42 AM
    Author     : HOME
--%>

<%@page import="com.college.project.bean.registration"%>
<%@page import="com.college.project.dao.registrationDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="adminLoginCss.css">
</head>
<body>
    
             <%
            String str="";
            if(request.getParameter("email")!=null && request.getParameter("ps")!=null){
            String email=request.getParameter("email");
            String ps=request.getParameter("ps");
            registrationDao rd=new registrationDao();
            
            registration result=rd.loginCheck(email, ps);
         
            
           
            if(result.getEnroll()!=null){
                
                out.println("Login Sucess");
                HttpSession hs=request.getSession();
                hs.setAttribute("res",result);
                response.sendRedirect("homeadmin.jsp");
            }
//            
            else{
                out.println("Please Enter the value");
                response.sendRedirect("admin.jsp");
            }
            }
        %>

   <!-- <h1 id = "logo"> TechQiz  </h1> -->
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

   <p><a class=" links" href="index.jsp">Home</a><a class=" links1" href="about.html" >About Us</a><a class=" links1" href="Login.jsp" >User Login</a></p>

    <div class="login-container">
        <h1> Admin Login</h1>
        <form action="admin.jsp" method="post">
            <label for="username">Email:</label>
            <input type="text" id="username" name="email" required><br><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="ps" required><br><br>

            <button type="submit"  value="submit">Submit</button>
            <!--<submit class="buttonadmin"><a href="adminLogin.jsp">Admin Login</a> </submit>-->
          

          </p>  
        </form>
    </div>
</body>
</html>
    