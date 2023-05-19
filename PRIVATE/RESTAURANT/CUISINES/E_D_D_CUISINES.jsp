<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CUISINES</title>
        <script src="CUISINES_ENTRY_FORM_TEST.js"></script>

    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
   <%!
            String cus;
            String sql;
            ResultSet result1;

        %>  
   
        <%          
            String url="jdbc:mysql://localhost:3306/travel";
         
            sql="SELECT C_NAME FROM CUISINES";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
             %><table border="1" cellpadding="6">
                <tr>
                        <th>
                        CUISINES
                        </th>
               </tr>

           <% while(result1.next())
            {
                cus=result1.getString("C_NAME");
              %><tr>
                        <td>
                 
                <%=cus%>
                        </td>
               </tr>                 
            <%}%>

             </table>
            <br><br><br>
            <form action="E_CUISINE.jsp" method="POST" name="cuisines_entry_form" onsubmit="return test()">
            <table border="1" cellpadding="6">
                <tr>
                    <td>
                        ENTER CUISINE:-
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="cuisine" required>
                       
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
        <form action="D_CUISINE.jsp" method="POST">
            <table border="1" cellpadding="6" >
                <tr>
                    <td>
                        SELECT CUISINE :-
                    </td>
                </tr>
                <tr>
        <td>
                        <select name="cuisine">
                            <%
                                result1.first();
                                do
                                {
                                    cus=result1.getString("C_NAME");
    %>
                         <option value="<%=cus%>"><%=cus%></option>
                      
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
