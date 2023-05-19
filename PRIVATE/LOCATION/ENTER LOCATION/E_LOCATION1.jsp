<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER LOCATION</title>
      	<script src="LOCATION_ENTRY_FORM_TEST.js"></script>

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
                
                
                state=request.getParameter("name");
                try
                  {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection d = DriverManager.getConnection(url,"root","");
                    Statement s1= d.createStatement();
                    sql="SELECT S_ID FROM STATE WHERE S_NAME='"+state+"'";
                    result1=s1.executeQuery(sql);
                    result1.next();
                    stateid=result1.getString("S_ID");
                    sql="SELECT COUNT(L_ID) FROM LOCATION WHERE S_ID='"+stateid+"'";
                    result1=s1.executeQuery(sql);
                    result1.next();
                    count=result1.getInt(1);
                    if(count>0)
                    {
                    sql="SELECT L_NAME,L_ID FROM LOCATION WHERE S_NAME='"+state+"'";
                    result1=s1.executeQuery(sql);
         
          %>

         <h1>LOCATIONS IN <%=state%></h1>
             <table border="1" cellpadding="4">
             <tr>
             <th>ID</th>
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
             <%}}catch(Exception e)
          {%>
            <%=e%>  
          <%}%>
          <br><br><br><br>
       <form action="E_LOCATION2.jsp" method="post" name="location_entry_form" onsubmit="return test()">
     <table border="1">      
              <tr>
                <td>ENTER NAME OF LOCATION:-</td>
                <td>
                    <input type="hidden" name="state" value="<%=state%>"> 
                    <input type="hidden" name="stateid" value="<%=stateid%>"> 
                    <input type="text" name="name" maxlength="20" required>
                </td>
              </tr> 
              <tr>
                <td>ENTER 3 CHARACTER ID OF LOCATION:-</td>
                <td><input type="text" name="id" maxlength="3" required></td>
              </tr> 
              <tr>
                <td colspan="2"> <input type="submit" value="ENTER"></td>
              </tr> 
     </table>
    </form>    
          
          
          
    </body>
</html>


            
 