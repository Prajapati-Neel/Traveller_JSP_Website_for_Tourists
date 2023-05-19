<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH RESULT</title>
    </head>
    <body>
        <jsp:include page="HEADER.jsp"/>
 <%!
        String name,sql,sname,lname;
        String statename,locationname,id;
        ResultSet result1,result2;
        int a,count;
 %>     
     <%     a=0;
            boolean presence=false;
            boolean testlocation= false;
            boolean teststate = false;
            boolean hotel=false;
            boolean restaurant=false; 
            boolean thing=false;
            name=request.getParameter("state_location_list");
            String url="jdbc:mysql://localhost:3306/travel";

           try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
                 if(name.contains(","))
           {
               a=name.indexOf(",");
               locationname=name.substring(0,a);
               statename=name.substring((a+1));
               sql="SELECT L_NAME,S_NAME FROM LOCATION";
               result1=s1.executeQuery(sql);
               while(result1.next())
               {
                   sname=result1.getString("S_NAME");
                   lname=result1.getString("L_NAME");
                   if(locationname.equals(lname) && statename.equals(sname))
                   {
                       testlocation=true;
                   }
               }
              
           }else
            {
             sql="SELECT S_NAME FROM STATE";
             result1=s1.executeQuery(sql);
             while(result1.next())
               { 
                statename=name;
                sname=result1.getString("S_NAME");
                 if(name.equals(sname))
                 {
                     teststate=true;
                 }
               }
            } 
            
            if(testlocation)
           {
               sql="SELECT L_ID FROM LOCATION WHERE L_NAME='"+locationname+"' AND S_NAME='"+statename+"'";
               result1=s1.executeQuery(sql);
               result1.next();
               id=result1.getString("L_ID");
                   
              %>
            <table  cellpadding="10">
              <%
              
                  
               sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
               result1=s1.executeQuery(sql);
               result1.next();
               count=result1.getInt(1);

                  if(count>0)
                  {
                   presence=true;   
                  
              %>  <tr> 
            
                    <form action="HOTELS.jsp" method="post">
                   <input type="hidden" name="name" value="<%=locationname%>">

                      <input type="hidden" name="id" value="<%=id%>">
                         <td>
                             <input type="submit" value="HOTELS">
                         </td>
                   </form>
             
             </tr><%} 
            sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
           if(count>0)
          {
              presence=true;   
             %>
                <tr> 
            
                    <form action="RESTAURANTS.jsp" method="post">
                   <input type="hidden" name="name" value="<%=locationname%>">
                      <input type="hidden" name="id" value="<%=id%>">
                         <td>
                             <input type="submit" value="RESTAURANTS">
                         </td>
                   </form>
             
             </tr> <%
                 } 
            sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
           if(count>0)
          {
             presence=true;   
             %>
                <tr> 
            
                    <form action="THINGS_TODO.jsp" method="post">
                    <input type="hidden" name="name" value="<%=locationname%>">
                     <input type="hidden" name="id" value="<%=id%>">
                         <td>
                             <input type="submit" value="THINGS TODO">
                         </td>
                   </form>
             
             </tr><%}%>
                       </table>
             <%
                 if(!presence)
                 {%>
                 <h1>Currently  we don't have any data about <%= locationname%></h1>
                 
                 <%}
             %>

              
              
              
         <%  }else if(teststate)
       {       
                             
               sql="SELECT COUNT(L_ID) FROM LOCATION WHERE S_NAME='"+statename+"'";
               result1=s1.executeQuery(sql);
               result1.next();
               count=result1.getInt(1);
               if(count>0)
               {

               a=0;
               sql="SELECT L_ID,L_NAME FROM LOCATION WHERE S_NAME='"+statename+"'";
               result1=s1.executeQuery(sql);
                
               count=0;
               while(result1.next())
             {
              hotel=thing=restaurant=false;
              id=result1.getString("L_ID");
              name=result1.getString("L_NAME");
              sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
               count=result2.getInt(1);
                if(count>0)
              {  
               presence=true;
               hotel=true;
              }
                    count=0;

              sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
              result2=s2.executeQuery(sql);
                result2.next();
               count=result2.getInt(1);
               
                if(count>0)
              {  
               presence=true;
               restaurant=true;
              }
                
              count=0;
            
              sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
               count=result2.getInt(1);
                if(count>0)
              {  
               presence=true;
               thing=true;
              }
               
               if(restaurant || thing || hotel)
               {
            %>
              <table  cellpadding="10">
                 
         
         <% 
              if(a%4==0)
              {
                  %><tr><%}%>
            
                  <form action="LOCAL.jsp" method="post">
                     <input type="hidden" name="id" value="<%=id%>">
                   <input type="hidden" name="name" value="<%=name%>">

             <td><input type="submit" value="<%=name%>"></td>
                  </form>
             <% if(a%4==3)
              {
                  %></tr><%}%>
                       
                       <%a++;}}%>
                       </table>
                       <%if(!presence)
{%>
               <h1>Currently  we don't have any data about locations of <%=statename%>  </h1>
                  <%

}%>
            <%}else
               {%>
               <h1>Currently  we don't have locations for <%=statename%>  </h1>
                  <%}
       }
           else
          {
        %>
        <h1>Enter valid data in search box</h1>
             <% } 

          }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
            
     
    
    </body>
</html>
