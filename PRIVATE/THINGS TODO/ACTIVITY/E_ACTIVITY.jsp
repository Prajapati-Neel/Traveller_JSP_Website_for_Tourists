<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER ACTIVITY</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
   <%!
            String ac,actemp;
            String sql;
            ResultSet result1;

        %>  
   
        <%    
            int b=0;
            boolean a=true;
            String url="jdbc:mysql://localhost:3306/travel";
           ac=request.getParameter("activity");
            sql="SELECT A_NAME FROM ACTIVITY";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            while(result1.next())
           {
             actemp=result1.getString("A_NAME");
             if(actemp.equals(ac))
             {
                 a=false;
             }
            }
            if(a)
             { 
               sql="INSERT INTO ACTIVITY (A_NAME) VALUES('"+ac+"')";
                  b=s1.executeUpdate(sql);
                }
             else {
              %>
              <h1>WE ALREADY KNOW ABOUT THIS ACTIVITY</h1> 
              <%}
                  if(b==1)
              {   %>
              <h1>ACTIVITY IS IN THE TABLE NOW</h1> 
               <% }else{%>
              <h1>ERROR</h1> 
             <%}}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>