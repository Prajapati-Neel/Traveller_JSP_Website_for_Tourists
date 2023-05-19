<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE STATE</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String name,id,sql;
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
            sql="SELECT COUNT(S_ID) FROM STATE";
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            if(count>0)
            {     sql="SELECT * FROM STATE";
                   result1=s1.executeQuery(sql);
            %>
            <table border="1" cellpadding="4">
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
        
            
          <br><br><br>
      <form action="D_STATE1.jsp" method="post">
      <table border="1">
        <tr>
          <td>
            SELECT STATE :-
          </td>
          <td>
            
        <select name="id">
         <%
             result1.first();
             do
            { 
                name=result1.getString("S_NAME");
                id=result1.getString("S_ID");
             %>
        <option value="<%=id%>"><%=name%> </option>
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
<h1>Currently We Don't know about any State</h1>
<%}

}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
    </form>
    </body>
</html>
