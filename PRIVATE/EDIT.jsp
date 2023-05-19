<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT</title>
    </head>
    <body>
        <%!
            int count;
            String sql,id;
            ResultSet result1,result2;

        %>
        
        <%
            boolean state=true;
            boolean location=true;
        
            String url="jdbc:mysql://localhost:3306/travel";
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
           
            
            
            
            sql="SELECT COUNT(S_ID) FROM STATE";
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            if(count==0)
            {
                state=false;
             %>
        <a href="STATE\ENTER STATE\E_STATE.jsp"><h1>ENTER STATE</h1></a>    
        <%}else
             { %>
              <a href="STATE\S_edit.html"><h1>STATE</h1></a>
               <%

             }
             
           if(state)
          {
            sql="SELECT COUNT(L_ID) FROM LOCATION";
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
          
            if(count==0)
             {
              location=false;
          %>
        <a href="LOCATION\ENTER LOCATION\E_LOCATION.jsp"><h1>ENTER LOCATION</h1></a>    
        <%   }
               else
              { %>
        <a href="LOCATION\L_edit.html"><h1>LOCATION</h1></a>
        <%

               }
             }
           

          if(state && location)
           {
             count=0;
            sql="SELECT L_ID FROM LOCATION";
            result1=s1.executeQuery(sql);
            while(result1.next())
             {
              id=result1.getString("L_ID");
              sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
              result2=s2.executeQuery(sql);
                result2.next();
               count=count+result2.getInt(1);
               }
                if(count==0)
              {  %>
        <a href="HOTEL\ENTER HOTEL\E_HOTEL.jsp"><h1>ENTER HOTEL</h1></a>    
        <% 
               }  else
              { %>
        <a href="HOTEL\H_edit.html"><h1>HOTEL</h1></a>
        <%

               }
           
               count=0;
               result1.beforeFirst();
             while(result1.next())
             {
              id=result1.getString("L_ID");
              sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
              result2=s2.executeQuery(sql);
                result2.next();
               count=count+result2.getInt(1);
               }
                if(count==0)
              {  %>
        <a href="RESTAURANT\ENTER RESTAURANT\E_RESTAURANT.jsp"><h1>ENTER RESTAURANT</h1></a>    
        <% 
               }  else
              { %>
        <a href="RESTAURANT\R_edit.html"><h1>RESTAURANT</h1></a>
        <%

               }


               count=0;
               result1.beforeFirst();
              sql="SELECT COUNT(A_NAME) FROM ACTIVITY";
              result2=s2.executeQuery(sql);
                result2.next();
               count=result2.getInt(1);
            if(count>0)
            {           
              count=0;
              while(result1.next())
             {
              id=result1.getString("L_ID");
              sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
              result2=s2.executeQuery(sql);
                result2.next();
               count=count+result2.getInt(1);
               }
                if(count==0)
              {  %>
        <a href="THINGS TODO\ENTER THINGS TODO\E_THINGS_TODO.jsp"><h1>ENTER THINGS TODO</h1></a>   
        <a href="THINGS TODO\ACTIVITY\E_D_D_ACTIVITY.jsp"><h1>ACTIVITY</h1></a>    

        <% 
               }  else
              { %>
        <a href="THINGS TODO\T_edit.html"><h1>THINGS TODO</h1></a>
        <%

               }
            }else
                {%>
        <a href="THINGS TODO\ACTIVITY\E_ACTIVITY_FOR_EDIT_PAGE.jsp"><h1>ENTER ACTIVITY</h1></a>    
<%
                    }



            }
        %>
       
        
        
      
         
                
                <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
    </body>
</html>
