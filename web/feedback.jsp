<%-- 
    Document   : feedback
    Created on : Nov 14, 2024, 12:03:18 PM
    Author     : HOME
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
    <link rel="stylesheet" href="feedback.css">
    
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
  <header>
      
    <h1>Technical Online Examination Portal</h1>
  </header>
    <nav class="links">
    <ul>
      <!--<li><a href="#">Contact Us</a></li>-->
      
       <li><a href="about.html">About Us</a></li>
      <li><a href="index.jsp">Home</a></li>
    </ul>
  </nav>

    <div class="feedback-form">
        <h2>FEEDBACK/REPORT A PROBLEM</h2>
        <p>You can send us your feedback through e-mail on the following e-mail id: <a href="prajapatisneha625@gmail.com">prajapatisneha625@gmail.com</a></p>
        <p>Or you can directly submit your feedback by filling the entries below:</p>
        <form>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" placeholder="Enter subject" required>

            <label for="email">E-mail address:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email ID" required>

            <label for="feedback">Write feedback here:</label>
            <textarea id="feedback" name="feedback" placeholder="Write your feedback here" required></textarea>

            <submit class="buttonsubmit"><a href="certificate.jsp">Submit</a> </submit>
        </form>
    </div>
</body>
</html>