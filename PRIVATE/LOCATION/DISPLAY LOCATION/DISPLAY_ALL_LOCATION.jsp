<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISPLAY ALL LOCATIONS</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
       <%!
            String state,stateid;
            String location,locationid,sql;
            ResultSet result1;
             %>
       <%         
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM LOCATION";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            %>
            <table border="1" cellpadding="10">
             <tr>
             <th>ID OF STATE</th>
             <th>NAME OF STATE</th>
             <th>ID OF LOCATION</th>
             <th>NAME OF LOCATION</th>
         </tr>    
         
        <%  while(result1.next())
            {
               state=result1.getString("S_NAME");
               stateid=result1.getString("S_ID");
                location=result1.getString("L_NAME");
               locationid=result1.getString("L_ID");
         %>
            
      <tr>
              <td><%=stateid%></td>
              <td><%=state%></td>
              <td><%=locationid%></td>
              <td><%=location%></td>
            
         </tr>
                       
                       <%}%>
                       </table>
          <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
            
     
    </body>
</html>
