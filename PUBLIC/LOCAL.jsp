<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String name,id,sql;
    ResultSet result1;
    int count;
%>
<%
       id=request.getParameter("id");
        name=request.getParameter("name");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=name%></title>
    </head>
  <body>
        <jsp:include page="HEADER.jsp"/>
      
       <%   
            int count=0;
            int a=0;  
            String url="jdbc:mysql://localhost:3306/travel";
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            
            %>
            <table  cellpadding="10">
            <%
                if(count>0)
                {
            %>
            <tr> 
            
                    <form action="HOTELS.jsp" method="post">
                   <input type="hidden" name="name" value="<%=name%>">

                      <input type="hidden" name="id" value="<%=id%>">
                         <td>
                             <input type="submit" value="HOTELS">
                         </td>
                   </form>
             
             </tr>
             <%
                 } 
            sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
           if(count>0)
          {
             %>
                <tr> 
            
                    <form action="RESTAURANTS.jsp" method="post">
                   <input type="hidden" name="name" value="<%=name%>">
                      <input type="hidden" name="id" value="<%=id%>">
                         <td>
                             <input type="submit" value="RESTAURANTS">
                         </td>
                   </form>
             
             </tr>     </tr>
             <%
                 } 
            sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
           if(count>0)
          {
             %>
                <tr> 
            
                    <form action="THINGS_TODO.jsp" method="post">
                    <input type="hidden" name="name" value="<%=name%>">
                     <input type="hidden" name="id" value="<%=id%>">
                         <td>
                             <input type="submit" value="THINGS TODO">
                         </td>
                   </form>
             
             </tr>
             <%}}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
                       </table>
        

     
    </body>
</html>
