<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE THINGS TODO</title>
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
            sql="DELETE FROM THINGS_"+locationid+" WHERE T_ID='"+id+"'";
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
              
             sql="SELECT COUNT(T_ID) FROM THINGS_"+locationid+" WHERE T_ID='"+id+"'";
              result1=s1.executeQuery(sql);
              result1.next();
              a=result1.getInt(1);
           if(a==1)
           {
              sql="DELETE FROM THINGS_"+locationid+" WHERE T_ID='"+id+"'";
             a=s1.executeUpdate(sql);

             if(a!=1)
             {
                  %>
                  <h1>THINGS TODO IS STILL IN THE TABLE</h1>
                 <%
            }  else
                 { %>
                  <h1>THINGS TODO IS NO LONGER WITH US</h1>
                 <%     } }else
            {%>
            <h1>ID=<%=id%> is not associated with any Thing</h1>    
         
            <%}
          }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>  
                              
        
      
 
       
