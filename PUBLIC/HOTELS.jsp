<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String location,locationid;

%>
<%
            locationid=request.getParameter("id");
           location=request.getParameter("name");
               %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotels in <%=location%></title>
    </head>
      <body>
 <jsp:include page="HEADER.jsp"/>
    <%!  
            
        String address,cno,name,id,sql;


        ResultSet result1;

    %> 
    
        <% 
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM HOTELS_"+locationid;
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
               while(result1.next())
            {
               name=result1.getString("H_NAME");
               cno=result1.getString("H_CNO");
               address=result1.getString("H_ADDRESS");
         %>
           
      

            <table border="1" cellpadding="6">
             <tr>
                 <td>
             NAME OF HOTEL:-<%=name%></br>
             ADDRESS:-<%=address%></br>
             CONTACT NO:-<%=cno%></br>
        
         
      
        </tr>
         
        <%}%>
      </table>
        <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
       
         
    </body>
</html>
