<%-- 
    Document   : Login.jsp
    Created on : Sep 10, 2024, 5:01:05 PM
    Author     : HOME
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="LoginCss.css">
</head>
<body>
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

   <p><a class=" links" href="index.jsp">Home</a><a class=" links1" href="about.html" >About Us</a></p>
       

    <div class="login-container">
        <h1>Login</h1>
        <form action="LoginController.jsp" method="post">
            <label for="username">Email:</label>
            <input type="text" id="username" name="email"  required><br><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="ps" required><br><br>

            <button type="submit"  value="submit">Submit</button>
            <submit class="buttonadmin"><a href="adminLogin.jsp">Admin Login</a> </submit>
          <p class ="register">don't have any account<a href="Registration.jsp"> register here </a> 

          </p>  
        </form>
    </div>
</body>
</html>
    