<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACTIVITY</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
   <%!
            String ac;
            String sql;
            ResultSet result1;

        %>  
   
        <%          
            String url="jdbc:mysql://localhost:3306/travel";
         
            sql="SELECT A_NAME FROM ACTIVITY";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
             %><table border="1" cellpadding="6">
                <tr>
                        <th>
                        ACTIVITY
                        </th>
               </tr>

           <% while(result1.next())
            {
                ac=result1.getString("A_NAME");
              %><tr>
                        <td>
                 
                <%=ac%>
                        </td>
               </tr>                 
            <%}%>

             </table>
            <br><br><br>
            <form action="E_ACTIVITY.jsp" method="POST">
            <table border="1" cellpadding="6">
                <tr>
                    <td>
                        ENTER ACTIVITY:-
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="activity" >
                       
                    </td>
                </tr>
                  <tr>
                    <td colspan="2">
                        <input type="submit" value="ENTER" >
                       
                    </td>
                </tr>
            </table>
            </form>
            <br><br><br>
        <form action="D_ACTIVITY.jsp" method="POST">
            <table border="1" cellpadding="6" >
                <tr>
                    <td>
                        SELECT ACTIVITY :-
                    </td>
                </tr>
                <tr>
        <td>
                        <select name="activity">
                            <%
                                result1.first();
                                do
                                {
                                    ac=result1.getString("A_NAME");
    %>
                         <option value="<%=ac%>"><%=ac%></option>
                      
       <%}   while(result1.next());

               }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
                        </select>
                    </td>
                </tr>
                  <tr>
                    <td colspan="2">
                        <input type="submit" value="DELETE" >
                       
                    </td>
                </tr>
            </table>
            </form>
  </body>
</html>
