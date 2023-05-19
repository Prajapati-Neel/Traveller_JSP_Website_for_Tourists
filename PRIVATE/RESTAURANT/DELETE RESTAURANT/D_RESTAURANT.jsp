<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE RESTAURANT</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
   <%!
            int count;
            String name,sql,id,state,locationid;
            ResultSet result1,result2,result3;
            %>
       <%   String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT S_NAME FROM STATE";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
            Statement s3= d.createStatement();
            result1=s1.executeQuery(sql);
     %>
            <table border="1" cellpadding="6">
          
           <form action="DELETE_RESTAURANT_BY_STATE.jsp" method="post">
               <tr>
            <td>
              DELETE RESTAURANT BY STATE
            </td>
            <td>
              SELECT STATE:-
            </td>
            <td>
           <select name="state" >
            <%
               
                while(result1.next())
                { 
                    count=0;
                    name=result1.getString("S_NAME");
                    sql="SELECT L_ID FROM LOCATION WHERE S_NAME='"+name+"'";
                   result2=s2.executeQuery(sql);
                   while(result2.next())
                   {
                    locationid=result2.getString("L_ID");
                    sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+locationid;
                    result3=s3.executeQuery(sql);
                    result3.next();
                    count=count+result3.getInt(1);
                   }
                   if(count>0){
                 %>
            <option value="<%=name%>"><%=name%> </option>
                 <%}}%>    
           </select>
            </td>
            <td>

              <input type="submit" value="GO">
           </td>
            
            </form>
            
              <form action="DELETE_ALL_RESTAURANTS_BY_STATE.jsp" method="post">
               <tr>
            <td>
              DELETE ALL RESTAURANTS BY STATE
            </td>
            <td>
              SELECT STATE:-
            </td>
            <td>
              <select name="state" >
              <%
               result1.beforeFirst();
               while(result1.next())
               { 
                   count=0;
                    name=result1.getString("S_NAME");
                    sql="SELECT L_ID FROM LOCATION WHERE S_NAME='"+name+"'";
                   result2=s2.executeQuery(sql);
                   while(result2.next())
                   {
                    locationid=result2.getString("L_ID");
                    sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+locationid;
                    result3=s3.executeQuery(sql);
                    result3.next();
                    count=count+result3.getInt(1);
                   }
                   if(count>0){                   
                 %>
            <option value="<%=name%>"><%=name%> </option>
                 <%}}%>
              </select>
            </td>
            <td>

              <input type="submit" value="DELETE ALL RESTAURANTS FROM SELECTED STATE">
           </td>
            
            </form>

               <form action="DELETE_RESTAURANT_BY_LOCATION.jsp" method="post">
               <tr>
            <td>
              DELETE RESTAURANT BY LOCATION
            </td>
            <td>
              SELECT LOCATION:-
            </td>
            <td>
              <select name="id" >
                <%
                 sql="SELECT L_NAME,L_ID,S_NAME FROM LOCATION";
                 result1=s1.executeQuery(sql);

                 while(result1.next())
                { 
                    count=0;
                    name=result1.getString("L_NAME");
                    id=result1.getString("L_ID");
                    state=result1.getString("S_NAME");
                    sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
                    result2=s2.executeQuery(sql);
                    result2.next();
                    count=result2.getInt(1);
                  if(count>0)
                  {
                 %>
            <option value="<%=id%>"><%=name%>,<%=state%> </option>
                 <%}}%>
              </select>
            </td>
            <td>
              <input type="submit" value="GO">
           </td>
               </tr>
            </form>
            
              <form action="DELETE_ALL_RESTAURANTS_BY_LOCATION.jsp" method="post">
               <tr>
            <td>
              DELETE ALL RESTAURANT BY LOCATION
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
                    state=result1.getString("S_NAME");
                    sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
                    result2=s2.executeQuery(sql);
                    result2.next();
                    count=result2.getInt(1);
                  if(count>0)
                  {
                 %>
            <option value="<%=id%>"><%=name%>,<%=state%> </option>
                 <%}} 
                  }catch(Exception e)
                {%>
                  <%=e%>    
                <%}%>  

              </select>
            </td>
            <td>

              <input type="submit" value="DELETE ALL RESTAURANTS FROM SELECTED LOCATION">
           </td>
            
            </form>

              
              <tr >
             <td colspan="4" align="center" >
              <form action="DELETE_ALL_RESTAURANTS.jsp" method="post">
             <input  type="submit" value="DELETE ALL RESTAURANTS">
            </td>
            </tr>           
            </table>
     </body>
 </html>
