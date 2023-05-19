<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISPLAY THINGS TODO</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
 <%!
            String location,locationid,sql,state;
            String address,cno,name,id,desc;
            String sun,mon,tue,wed,thu,fry,sat;
            String h24,ac,ach;
            int count;          
        
            ResultSet result1,result2;                  
            %>
       

<%   
           String  days="";   
           String url="jdbc:mysql://localhost:3306/travel";
           state=request.getParameter("state");
           sql="SELECT L_NAME,L_ID FROM LOCATION WHERE S_NAME='"+state+"'";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s2= d.createStatement();
            Statement s1= d.createStatement();

            result1=s1.executeQuery(sql);
           %>
           <table border="1" cellpadding="6">
                 <%while(result1.next())
            {     
                count=0;
                location=result1.getString("L_NAME");
                locationid=result1.getString("L_ID");
                sql="SELECT COUNT(T_ID) FROM THINGS_"+locationid;
                result2=s2.executeQuery(sql);
                result2.next();
                count=result2.getInt(1);
                if(count>0) 
                {
                
                sql="SELECT * FROM THINGS_"+locationid;
                result2=s2.executeQuery(sql);
          %>
          <tr><th colspan="8" >THINGS TO DO IN <%=location%></th></tr>
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
            
             while(result2.next())
            {
               days="";
               name=result2.getString("T_NAME");
               id=result2.getString("T_ID");
               cno=result2.getString("T_CNO");
               address=result2.getString("T_ADDRESS");
               sun=result2.getString("SUN");
               mon=result2.getString("MON");
               tue=result2.getString("TUE");
               wed=result2.getString("WED");
               thu=result2.getString("THU");
               fry=result2.getString("FRY"); 
               sat=result2.getString("SAT");
               ac=result2.getString("T_ACTIVITY");
               ach=result2.getString("ACTIVEHOURS");
               desc=result2.getString("T_DES");
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
         
                       
                       
         
       
          <% }}}}catch(Exception e)
          {%>
            <%=e%>    
          <%}%> 
          </table>
    </body>
</html>
