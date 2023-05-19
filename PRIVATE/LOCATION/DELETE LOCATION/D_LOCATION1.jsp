<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE LOCATION</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String location,locationid,sql,state,stateid,locationtemp,statetemp,locationidtemp;
            ResultSet result1;
            int count;
            %>
       <%   
           int a=0,b=1,c=1,f=1;
           locationid=request.getParameter("id");
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT L_NAME,S_NAME FROM LOCATION WHERE L_ID='"+locationid+"'";
            
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            if(result1.next())
            {
            state=result1.getString("S_NAME");
            location=result1.getString("L_NAME");
            sql="DELETE FROM LOCATION WHERE L_ID='"+locationid+"'";
            a=s1.executeUpdate(sql);
            
                if(a==1)
                {
                    sql="DROP TABLE HOTELS_"+locationid;
                    b=s1.executeUpdate(sql);
                      sql="DROP TABLE RESTAURANTS_"+locationid;
                    c=s1.executeUpdate(sql);
                     sql="DROP TABLE THINGS_"+locationid;
                    f=s1.executeUpdate(sql);

                  %>
                <h1><%=location%>,<%=state%> is no longer with us </h1>  
                <%   sql="SELECT COUNT(L_ID) FROM LOCATION";
                    result1=s1.executeQuery(sql);
                    result1.next();
                    count=result1.getInt(1);
                    if(count>0)
                    {
                    
                    sql="SELECT * FROM location";
                    result1=s1.executeQuery(sql);
                %>
         <table border="1" cellpadding="10">
             <tr>
             <th>ID OF STATE</th>
             <th>NAME OF STATE</th>
             <th>ID OF LOCATION</th>
             <th>NAME OF LOCATION</th>
         </tr>    
         
        <%  while(result1.next())
            {
               statetemp=result1.getString("S_NAME");
               stateid=result1.getString("S_ID");
                locationtemp=result1.getString("L_NAME");
               locationidtemp=result1.getString("L_ID");
         %>
            
      <tr>
              <td><%=stateid%></td>
              <td><%=statetemp%></td>
              <td><%=locationidtemp%></td>
              <td><%=locationtemp%></td>
            
         </tr>
                       
                       <%}%>
                       </table>
           <form method="post" action="D_LOCATION.jsp">
              <input type="submit" value="Delete Another Location">
          </form>
     

                <%}}
            if(a==0)
                {
                 %>
                <h1>CAN NOT DELETE LOCATION :-<%=location%>,<%=state%></h1>  
                <%   
                }
                if(b==1)
                {
                 %>
                <h1>MANUALLY DELETE TABLE:-HOTELS_<%=locationid%></h1>  
                <%   
                } if(c==1)
                {
                 %>
                <h1>MANUALLY DELETE TABLE:-RESTAURANTS_<%=locationid%></h1>  
                <%   
                }if(f==1)
                {
                 %>
                <h1>MANUALLY DELETE TABLE:-THINGS_<%=locationid%></h1>  
                <%   
                }
            
            } else
            {%>
            <h1>ID=<%=locationid%> is not associated with any location</h1>    
           <form method="post" action="D_LOCATION.jsp">
             <input type="submit" value="Try Again">
                </form> 
            <%}
            
            
            }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
         
    </body>
</html>
   