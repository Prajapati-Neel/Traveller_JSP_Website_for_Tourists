<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER HOTEL</title>
         
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            int count;
            String state;
            String sql;
            ResultSet result1,result2;

        %>
        <%          
            String url="jdbc:mysql://localhost:3306/travel";
         
            sql="SELECT S_NAME FROM STATE";
              try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
             Statement s1= d.createStatement();
            Statement s2= d.createStatement();
            result1=s1.executeQuery(sql);
            %>
              <form action="E_HOTEL1.jsp" method="post">
      <table border="1">
        <tr>
          <td>
            SELECT STATE :-
          </td>
          <td>
            
        <select name="state">
         <%
              
             while(result1.next())
            { 
                count=0;
                state=result1.getString("S_NAME");
                sql="SELECT COUNT(L_ID) FROM LOCATION WHERE S_NAME='"+state+"'";
                result2=s2.executeQuery(sql);
                result2.next();
                count=result2.getInt(1);
                if(count>0)
                {
                %>
        <option value="<%=state%>"><%=state%> </option>
             <%}}%>
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
            
            

