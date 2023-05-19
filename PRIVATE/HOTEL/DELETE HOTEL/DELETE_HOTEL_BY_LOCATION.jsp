<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE HOTEL</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
    <%!  
        String address,cno,name,id,locationid,sql;
        ResultSet result1;

    %> 
    
        <% 
            locationid = request.getParameter("id");
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM HOTELS_"+locationid;
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            
      
%>
            <table border="1" cellpadding="10">
             <tr>
             <th>ID</th>
             <th>NAME OF HOTEL</th>
             <th>ADDRESS</th>
             <th>CONTACT NO</th>
         </tr>   
         
         <%  
             while(result1.next())
            {
               name=result1.getString("H_NAME");
               id=result1.getString("H_ID");
               cno=result1.getString("H_CNO");
               address=result1.getString("H_ADDRESS");
         %>
            

         <tr>
              <td><%=id%></td>
             <td><%=name%></td>
             <td><%=address%></td>
             <td><%=cno%></td>
         </tr>

                       
                       <%}%>
                       </table>
 
                       <br><br><br><br>
     <form action="DELETE_HOTEL_BY_LOCATION1.jsp" method="post">
        <table border="1" cellpadding="10">
                          
             <tr>
                 <td>SELECT HOTEL</td> 
              <td>
           <input type="hidden" value="<%=locationid%>" name="locationid">
            <select name="id">
       <%  
             result1.first();
            do
            {   
               name=result1.getString("H_NAME");
               id=result1.getString("H_ID");
         %>

                <option name="id" value="<%=id%>"><%=name%></option>
             
             


          <%}while(result1.next());
               }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>   
            </select>

            </td>   

            <td>
                <input type="submit" value="DELETE">
                    
            </td>
         </tr>
        </table>
    </form>
    </body>
</html>

