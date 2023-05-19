<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER LOCATION</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
 <%!
            String name,id,sql;
            ResultSet result1;
            %>
       <%         
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT S_NAME FROM STATE";
               
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
            
        <form action="E_LOCATION1.jsp" method="post">
          <table border="1">
            <tr>
              <td>
                SELECT STATE :-
              </td>
              <td>

            <select name="name">
             <%
                
                 while(result1.next())
                { 
                    name=result1.getString("S_NAME");
                   
                 %>
            <option value="<%=name%>"><%=name%> </option>
                 <%}%>
            </select>
             </td>

            </tr>
            <tr>
              <td align="right" colspan="2"><input type="submit"  value="GO"></td>
            </tr>
          </table>
    </form>
    </body>
</html>

       