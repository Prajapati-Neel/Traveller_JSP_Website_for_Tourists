<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>States</title>
    </head>
    <body>
        <jsp:include page="HEADER.jsp"/>
        <%!
            String name,id,sql;
        ResultSet result1,result2,result3;
        int count;
            %>
            
       <%         
           int a=0;
           
           boolean state=true;
           boolean location=true;
           boolean hotel=true;
           boolean restaurant=true; 
           boolean thing=true;
           
           String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT S_NAME FROM STATE";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
            Statement s3= d.createStatement();
            %>
            <table  cellpadding="10">
                 
         
            <%sql="SELECT S_NAME FROM STATE";
            result1=s1.executeQuery(sql);
            
            while(result1.next())
            {
               hotel=restaurant=thing=false;
               name=result1.getString("S_NAME");
               sql="SELECT COUNT(L_ID) FROM LOCATION WHERE S_NAME='"+name+"'";
               result2=s2.executeQuery(sql);
               result2.next();
               count=result2.getInt(1);
               if(count>0)
               {
               sql="SELECT L_ID FROM LOCATION WHERE S_NAME='"+name+"'";
               result2=s2.executeQuery(sql);
                
               count=0;
               while(result2.next())
             {
              id=result2.getString("L_ID");
              sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
              result3=s3.executeQuery(sql);
              result3.next();
               count=count+result3.getInt(1);
               }
                if(count>0)
              {  
               hotel=true;
              }
                    count=0;
              result2.beforeFirst();      
               while(result2.next())
             {
              id=result2.getString("L_ID");
              sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
              result3=s3.executeQuery(sql);
                result3.next();
               count=count+result3.getInt(1);
               }
                if(count>0)
              {  
               restaurant=true;
              }
                
              count=0;
              result2.beforeFirst();
               while(result2.next())
             {
              id=result2.getString("L_ID");
              sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
              result3=s3.executeQuery(sql);
              result3.next();
               count=count+result3.getInt(1);
               }
                if(count>0)
              {  
               thing=true;
              }
               }
               if(restaurant || thing || hotel)
               {
                   if(a%4==0)
                   {
                       %>
                       <tr>
                   <%}%>
           
                       <form action="LOCATIONS.jsp" method="post">
                      <input type="hidden" name="name" value="<%=name%>">
             <td><input type="submit" value="<%=name%>"></td>
                  </form>
  
             <% if(a%4==3)
              {
                  %></tr><%}%>
                       
                       <%a++;}}%>
                       
            
                       </table>
          <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
            
     
    </body>
</html>
