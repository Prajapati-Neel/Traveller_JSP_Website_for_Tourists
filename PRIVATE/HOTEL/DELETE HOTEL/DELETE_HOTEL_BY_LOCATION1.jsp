<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE HOTEL</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
    <%!  
        String id,locationid,sql;
           ResultSet result1;
   %>
  
        <% 
            int a=0;
            locationid = request.getParameter("locationid");
            id = request.getParameter("id");
            String url="jdbc:mysql://localhost:3306/travel";
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            
             sql="SELECT COUNT(H_ID) FROM HOTELS_"+locationid+" WHERE H_ID='"+id+"'";
              result1=s1.executeQuery(sql);
              result1.next();
              a=result1.getInt(1);
           if(a==1)
           {
              sql="DELETE FROM HOTELS_"+locationid+" WHERE H_ID='"+id+"'";
             a=s1.executeUpdate(sql);

             if(a!=1)
             {
                  %>
                  <h1>HOTEL IS STILL IN THE TABLE</h1>
                 <%
            }  else
                 { %>
                  <h1>HOTEL IS NO LONGER WITH US</h1>
                 <%     }
          }else
            {%>
            <h1>ID=<%=id%> is not associated with any Hotel</h1>    
         
            <%}
            
           }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>  
                              
        
      
 
       
