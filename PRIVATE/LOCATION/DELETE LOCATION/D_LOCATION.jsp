<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE LOCATION</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
       <%!
            String state,stateid;
            String location,locationid,sql;
            ResultSet result1;
            int count;
             %>
       <%         
            String url="jdbc:mysql://localhost:3306/travel";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            sql="SELECT COUNT(L_ID) FROM LOCATION";
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            if(count>0)
            {
            sql="SELECT * FROM LOCATION";
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
        
      <form action="D_LOCATION1.jsp" method="post">
      <table border="1">
        <tr>
          <td>
            SELECT LOCATION :-
          </td>
          <td>
            
        <select name="id">
         <%
             result1.first();
             do
            { 
                state=result1.getString("S_NAME");
                locationid=result1.getString("L_ID");
                location=result1.getString("L_NAME");
         %>
        <option value="<%=locationid%>"><%=location%>, <%=state%> </option>
             <%}while(result1.next());%>
        </select>
         </td>
         
        </tr>
        <tr>
          <td align="right" colspan="2"><input type="submit"  value="DELETE"></td>
        </tr>
      </table>
          <%}
           else
{
%>
<h1>Currently We Don't know about any location</h1>
<%}


            }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
            
    </form>
    </body>
</html>
