<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER STATE</title>
        <script src="STATE_ENTRY_FORM_TEST.js"></script>

    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String state,stateid,sql,name,id;
            ResultSet result1;
            int count;

        %>
        <%  
            
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT COUNT(S_ID) FROM STATE";
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
                result1.next();
                count=result1.getInt(1);
                if(count>0)
                {
                sql="SELECT * FROM STATE";
                result1=s1.executeQuery(sql);

            %>
             <table border="1" cellpadding="10">
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
          <%}}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
          <br><br><br>
     <form action="E_STATE1.jsp" method="post" name="state_entry_form" onsubmit="return test()">
     <table border="1">      
              <tr>
                <td>ENTER NAME OF STATE:-</td>
                <td>
                    <input type="text" name="name" maxlength="20" required>
                </td>
              </tr> 
              <tr>
                <td>ENTER 2 CHARACTER ID OF STATE:-</td>
                <td><input type="text" name="id" maxlength="2" required></td>
              </tr> 
              <tr>
                <td colspan="2"> <input type="submit" value="ENTER"></td>
              </tr> 
     </table>
    </form>    
          
          
          
    </body>
</html>
