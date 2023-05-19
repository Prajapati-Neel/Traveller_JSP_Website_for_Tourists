<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE ACTIVITY</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
   <%!
            String ac;
            String sql;

        %>  
   
        <%    
            int a=0;
      
            String url="jdbc:mysql://localhost:3306/travel";
           ac=request.getParameter("activity");
            sql="DELETE FROM ACTIVITY WHERE A_NAME='"+ac+"'";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            a=s1.executeUpdate(sql);
             if(a==1)
             {
        %>
        <h1>
            ACTIVITY REMOVED
        </h1><%}else
{

        %>
        <h1>
           ERROR
        </h1>
          <%}}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
                   