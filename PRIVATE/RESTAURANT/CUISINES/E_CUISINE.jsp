<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER CUISINES</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>

   <%!
            String cus,custemp;
            String sql;
            ResultSet result1;

        %>  
   
        <%    
            int b=0;
            boolean a=true;
            String url="jdbc:mysql://localhost:3306/travel";
           cus=request.getParameter("cuisine");
            sql="SELECT C_NAME FROM CUISINES";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            while(result1.next())
           {
             custemp=result1.getString("C_NAME");
             if(custemp.equals(cus))
             {
                 a=false;
             }
            }
            if(a)
             { 
               sql="INSERT INTO CUISINES (C_NAME) VALUES('"+cus+"')";
                  b=s1.executeUpdate(sql);
                }
             else {
              %>
              <h1>WE ALREADY KNOW ABOUT THIS CUISINE</h1> 
              <%}
                  if(b==1)
              {   %>
              <h1>CUSINE IS IN THE TABLE NOW</h1> 
               <% }else{%>
              <h1>ERROR</h1> 
             <%}}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>