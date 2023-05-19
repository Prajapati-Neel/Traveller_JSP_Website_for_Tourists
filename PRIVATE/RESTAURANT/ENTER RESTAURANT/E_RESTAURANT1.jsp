<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER RESTAURANT</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
                        String location,locationid,sql;
                        String state;  
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
            %>
        <form action="E_RESTAURANT2.jsp" method="post">
            <input type="hidden" name="state" value="<%=state%>" >
      <table border="1">
        <tr>
          <td>
            SELECT LOCATION :-
          </td>
          <td>
            
        <select name="id">
         <%
             
             while(result1.next())
            { 
                location=result1.getString("L_NAME");
                locationid=result1.getString("L_ID");
             %>
        <option value="<%=locationid%>"><%=location%> </option>
             <%}%>
        </select>
         </td>
         
        </tr>
        <tr>
          <td align="right" colspan="2"><input type="submit"  value="GO"></td>
        </tr>
      </table>
    </form>
   <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
    </body>
</html>
