<%@page import="java.util.concurrent.TimeUnit" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify</title>
    </head>
    <body>
        <%!
            String pass1,pass2;
            %>
        <% 
           pass1="DE49715";
            pass2=request.getParameter("password");
        
            if(pass1.equals(pass2))
            {%> 
               <jsp:forward page="EDIT.jsp" />
              <%}else{%>
              
            <jsp:forward page="verify.html"/>
            <%}%>
    </body>
    
</html>
