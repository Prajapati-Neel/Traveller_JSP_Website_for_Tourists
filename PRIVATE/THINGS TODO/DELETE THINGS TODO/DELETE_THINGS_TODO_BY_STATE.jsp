<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE THINGS TODO</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            int count;
            String name,sql,id,state;
            ResultSet result1,result2;
            %>
       <%   
           state=request.getParameter("state");
           String url="jdbc:mysql://localhost:3306/travel";
           sql="SELECT L_NAME,L_ID FROM LOCATION WHERE S_NAME='"+state+"'";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
            result1=s1.executeQuery(sql);
     %>
    <table border="1" cellpadding="6">
    </form>

               <form action="DELETE_THINGS_TODO_BY_LOCATION.jsp" method="post">
               <tr>
            <td>
              DELETE THINGS TODO BY LOCATION
            </td>
            <td>
              SELECT LOCATION:-
            </td>
            <td>
              <select name="id" >
             <%
                 while(result1.next())
                { 
                     
                    count=0;
                    name=result1.getString("L_NAME");
                    id=result1.getString("L_ID");
                    sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
                    result2=s2.executeQuery(sql);
                    result2.next();
                    count=result2.getInt(1);
                  if(count>0)
                  {
                 %>
            <option value="<%=id%>"><%=name%> </option>
                 <%}}%>
              </select>
            </td>
            <td>
              <input type="submit" value="GO">
           </td>
               </tr>
            </form>
            
              <form action="DELETE_ALL_THINGS_TODO_BY_LOCATION.jsp" method="post">
               <tr>
            <td>
              DELETE ALL THINGS TODO BY LOCATION
            </td>
            <td>
              SELECT LOCATION:-
            </td>
            <td>
              <select name="id" >
             <%
               result1.beforeFirst();
               while(result1.next())
                { 
                    name=result1.getString("L_NAME");
                   id=result1.getString("L_ID");
                    sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
                    result2=s2.executeQuery(sql);
                    result2.next();
                    count=result2.getInt(1);
                   if(count>0)
                   {
                 %>
            <option value="<%=id%>"><%=name%> </option>
                 <%} }
                  }catch(Exception e)
                {%>
                  <%=e%>    
                <%}%>  

              </select>
            </td>
            <td>

              <input type="submit" value="DELETE ALL THINGS TODO FROM SELECTED LOCATION">
           </td>
            
            </form>
    </table>
    </body>
</html>