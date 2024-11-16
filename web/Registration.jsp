<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
    <link rel="stylesheet" href="RegistrationCss.css">
</head>
<body>
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


    <div class="registration-container">
        <h1>Registration</h1>
        <form action="RegistrationController.jsp" method="post">
            <label for="enroll">Enrollment no. :</label>
            <input type="text" id="enroll" name="enroll" required><br><br>

             <label for="name">Name :</label>
            <input type="text" id="name" name="nm" required><br><br>

            <label for="email">Email :</label>
            <input type="email" id="email" name="email" required><br><br>

            <label for="password">Password :</label>
            <input type="password" id="password" name="ps" required><br><br>

            <label for="sem">Semester : </label>
            <input type="text" id="sem" name="sem" required><br><br>

            <label for="clg">College : </label>
            <input type="text" id="clg" name="clg" required><br><br>
            
             <label for="ct">City : </label>
            <input type="text" id="ct" name="ct" required><br><br>
            
            <button type="submit">Sign Up</button>

            <p class ="login">Have any account<a href="Login.jsp">login here </a> 

            </p> 
        </form>
    </div>
</body>
</html>
