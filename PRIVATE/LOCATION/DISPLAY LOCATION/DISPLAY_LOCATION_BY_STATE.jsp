<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCATIONS IN STATE</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String location,locationid,sql,state;
            ResultSet result1;
            %>
       <%   
           String url="jdbc:mysql://localhost:3306/travel";
           state=request.getParameter("state");
           sql="SELECT L_NAME,L_ID FROM LOCATION WHERE S_NAME='"+state+"'";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            }catch(Exception e)
          {%>
            <%=e%>    
          <%}%> 
          <h1>locations in state:-<%=state%></h1>
           <table border="1" cellpadding="10">
             <tr>
             <th>ID OF LOCATION</th>
             <th>NAME OF LOCATION</th>
         </tr>   
         
         <%  while(result1.next())
            {
                location=result1.getString("L_NAME");
               locationid=result1.getString("L_ID");
         %>
            

         <tr>
              <td><%=locationid%></td>
              <td><%=location%></td>
             
         </tr>
         
                       
                       <%}%>
                       </table>
           
       
    </body>
</html>
