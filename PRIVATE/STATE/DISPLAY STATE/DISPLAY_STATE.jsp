<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISPLAY STATE</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String name,id,sql;
            ResultSet result1;
            %>
       <%         
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM STATE";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            %>
            <table border="1" cellpadding="10">
             <tr>
             <th>NAME OF STATE</th>
             <th>ID</th>
         </tr>   
         
         <%  while(result1.next())
            {
               name=result1.getString("S_NAME");
               id=result1.getString("S_ID");
         %>
            

         <tr>
             <td><%=name%></td>
             <td><%=id%></td>
         </tr>
         
                       
                       <%}%>
                       </table>
          <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
            
     
    </body>
</html>
