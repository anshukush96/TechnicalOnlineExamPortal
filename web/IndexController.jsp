<%-- 
    Document   : IndexController
    Created on : Nov 12, 2024, 9:20:20 PM
    Author     : HOME
--%>

<%@page import="com.college.project.dao.javaDao"%>
<%@page import="com.college.project.bean.InsertJavaQuestion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
           String str="";
           if(request.getParameter("id")!=null && request.getParameter("ques")!=null && request.getParameter("option1")!=null && request.getParameter("option2")!=null && request.getParameter("option3")!=null && request.getParameter("option4")!=null && request.getParameter("correct_answer")!=null){
       int id=Integer.parseInt(request.getParameter("id"));
       String ques=request.getParameter("ques");
       String option1 =request.getParameter("option1");
       String option2=request.getParameter("option2");
       String option3=request.getParameter("option3");
        String option4=request.getParameter("option4");
       String correct_answer=request.getParameter("correct_answer");

        InsertJavaQuestion rg=new InsertJavaQuestion();
        
        rg.setId(id);
        rg.setQuestion(ques);
        rg.setOption1(option1);
        rg.setOption2(option2);
        rg.setOption3(option3);
        rg.setOption4(option4);
        rg.setCorrect_answer(correct_answer);
       javaDao rd=new javaDao();
        int r=rd.addJava(rg);
        
        if(r>0){
            str="Account create Success";
//            response.sendRedirect("LoginPage.jsp");
        }
           }
       %>
<!--       <div class="acccont">-->
           
           <h1><%= str%></h1><br>
       <h2><a href="./IndexController.jsp">Insert</a></h2>
      
       <!--</div>-->
       
     
    </body>
</html>
</html>
