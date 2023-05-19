<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String sname;
%>
<%
    sname=request.getParameter("name");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locations in <%=sname%></title>
    </head>
  <body>
        <jsp:include page="HEADER.jsp"/>
        <%!
            String name,id,sql;
        ResultSet result1,result2;
        int count;
            %>
       <%  
           boolean hotel=true;
           boolean restaurant=true; 
           boolean thing=true;
         
            int a=0;  
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT L_NAME,L_ID FROM LOCATION WHERE S_NAME='"+sname+"'";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
            %>
            <table  cellpadding="10">
                 
         
        <%      result1=s1.executeQuery(sql);

            while(result1.next())
            {
               hotel=restaurant=thing=false;

               name=result1.getString("L_NAME");
               id=result1.getString("L_ID");
               
              sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
              count=result2.getInt(1);
              if(count>0)
                {
                hotel=true;
                }
               
 
              sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
              count=result2.getInt(1);
              if(count>0)
                {
                restaurant=true;
                }


              sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
              count=result2.getInt(1);
              if(count>0)
                {
                thing=true;
                }
              if(restaurant || thing || hotel)
               {
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
          <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
            
     
    </body>
</html>
