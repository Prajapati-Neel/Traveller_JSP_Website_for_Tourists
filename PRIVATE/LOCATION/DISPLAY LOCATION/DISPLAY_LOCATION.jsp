<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISPLAY LOCATION</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String name,sql;
            ResultSet result1;
            %>
       <%   String url="jdbc:mysql://localhost:3306/travel";
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
         <table border="1" cellpadding="6">
          
           <form action="DISPLAY_LOCATION_BY_STATE.jsp" method="post">
               <tr>
            <td>
              DISPLAY LOCATION BY STATE
            </td>
            <td>
              SELECT STATE:-
            </td>
            <td>
              <select name="state" >
             <%
               
                 while(result1.next())
                { 
                    name=result1.getString("S_NAME");
                   
                 %>
            <option value="<%=name%>"><%=name%> </option>
                 <%}%>
              </select>
            </td>
            <td>

              <input type="submit" value="display">
           </td>
            </tr>
            </form>
            <tr >
             <td colspan="4" >
              <form action="DISPLAY_ALL_LOCATION.jsp" method="post">
             <input  type="submit" value="DISPLAY ALL LOCATIONS">
            </td>
            </tr>           
            </table>
     </body>
 </html>
