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
         String address,cno,name,id,locationid,sql,desc;
         String sun,mon,tue,wed,thu,fry,sat;
         String h24,ac,ach;
         ResultSet result1;

    %> 
    
        <% 
            String  days="";   
            locationid = request.getParameter("id");
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM THINGS_"+locationid;
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            
      
%>
           
              <table border="1" cellpadding="10">
             <tr>
             <th>ID</th>
             <th>TYPE OF ACTIVITY</th>
             <th>NAME OF THINGS TO DO</th>
             <th>ADDRESS</th>
             <th>CONTACT NO</th>
             <th>DAYS AVAILABLE</th>
             <th>ACTIVE HOURS</th>
             <th>DESCRIPTION</th>
         </tr>   
         
           <%  
            
             while(result1.next())
            {
               days="";
               name=result1.getString("T_NAME");
               id=result1.getString("T_ID");
               cno=result1.getString("T_CNO");
               address=result1.getString("T_ADDRESS");
               sun=result1.getString("SUN");
               mon=result1.getString("MON");
               tue=result1.getString("TUE");
               wed=result1.getString("WED");
               thu=result1.getString("THU");
               fry=result1.getString("FRY"); 
               sat=result1.getString("SAT");
               ac=result1.getString("T_ACTIVITY");
               ach=result1.getString("ACTIVEHOURS");
               desc=result1.getString("T_DES");
               if(sun.equals("Y"))                 

               {
                days="SUN,";   
               }
                if(mon.equals("Y"))
               {
                days=days+"MON,";  
               } if(tue.equals("Y"))
               {
                days=days+"TUE,";  
               } if(wed.equals("Y"))
               {
                days=days+"WED,"; 
               }
                if(thu.equals("Y"))
               {
                days=days+"THU,"; 
               } if(fry.equals("Y"))
               {
                days=days+"FRY,";  
               } if(sat.equals("Y"))
               {
                days=days+"SAT,"; 
               }
      if(sun.equals("Y") && mon.equals("Y") && tue.equals("Y") && wed.equals("Y") && thu.equals("Y") && fry.equals("Y") )
                       {
                           if(sun.equals("Y") &&  sat.equals("Y"))
                           {
                               days="THROUGHOUT WEEK";
                           }else
                           {
                               days="WEEKDAYS";                            
                           }
                       }
      if(sun.equals("Y") && mon.equals("N") && tue.equals("N") && !wed.equals("N") && thu.equals("N") && fry.equals("N") && sat.equals("Y"))
      {
          days="WEEKENDS";
      }
           
                if(desc.equals("null"))
               {
                   desc=" ";
               }
               
         %>
            

         <tr>
              <td><%=id%></td>
             <td><%=ac%></td>
             <td><%=name%></td>
             <td><%=address%></td>
             <td><%=cno%></td>
             <td><%=days%></td>
             <td><%=ach%></td>
             <td><%=desc%></td>
         </tr>
         
                       
                       <%}%>
            </table>
       
                       <br><br><br><br>
     <form action="DELETE_THINGS_TODO_BY_LOCATION1.jsp" method="post">
        <table border="1" cellpadding="10">
                          
             <tr>
                 <td>SELECT THINGS TODO</td> 
              <td>
           <input type="hidden" value="<%=locationid%>" name="locationid">
            <select name="id">
       <%  
             result1.first();
            do
            {   
               name=result1.getString("T_NAME");
               id=result1.getString("T_ID");
         %>

                <option name="id" value="<%=id%>"><%=name%></option>
             
             


          <%}while(result1.next());
               }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>   
            </select>

            </td>   

            <td>
                <input type="submit" value="DELETE">
                    
            </td>
         </tr>
        </table>
    </form>
    </body>
</html>

