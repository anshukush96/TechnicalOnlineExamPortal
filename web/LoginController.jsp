
<%@page import="com.college.project.bean.registration"%>
<%@page import="com.college.project.dao.registrationDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                response.sendRedirect("home.jsp");
            }
//            
            else{
                out.println("Please Enter the value");
                response.sendRedirect("Login.jsp");
            }
            }
        %>
    </body>
</html>

