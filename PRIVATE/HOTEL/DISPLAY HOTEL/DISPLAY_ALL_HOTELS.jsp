<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISPLAY HOTEL</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
 <%!
            String location,locationid,sql,state;
            String address,cno,name,id;
            int count;          

            ResultSet result1,result2;                  
            %>
       

<%   
           String url="jdbc:mysql://localhost:3306/travel";
           state=request.getParameter("state");
           sql="SELECT L_NAME,L_ID,S_NAME FROM LOCATION ORDER BY S_NAME";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();

            result1=s1.executeQuery(sql);
           %>
           <table border="1" cellpadding="6">
               <%while(result1.next())
            {     
                count=0;
                location=result1.getString("L_NAME");
                locationid=result1.getString("L_ID");
                state=result1.getString("S_NAME");
                sql="SELECT COUNT(H_ID) FROM HOTELS_"+locationid;
                result2=s2.executeQuery(sql);
                result2.next();
                 count=result2.getInt(1);
                  if(count>0)
                  {
                sql="SELECT * FROM HOTELS_"+locationid;
               result2=s2.executeQuery(sql);
          %>
          <tr><th colspan="5" >HOTELS IN <%=location%><%=state%></th></tr>
          <tr>
             <th>LOCATION,STATE</th>
             <th>ID</th>
             <th>NAME OF HOTEL</th>
             <th>ADDRESS</th>
             <th>CONTACT NO</th>
         </tr>   
         
         <%  
               
                      while(result2.next())
            {     
                name=result2.getString("H_NAME");
               id=result2.getString("H_ID");
               cno=result2.getString("H_CNO");
               address=result2.getString("H_ADDRESS");
            
           %>
             <tr>
              <td><%=location%>,<%=state%></td>
              <td><%=id%></td>
             <td><%=name%></td>
             <td><%=address%></td>
             <td><%=cno%></td>
         </tr>
         
                       
                       <%}}}%>
                       </table>
           
          <% }catch(Exception e)
          {%>
            <%=e%>    
          <%}%> 
         
    </body>
</html>
