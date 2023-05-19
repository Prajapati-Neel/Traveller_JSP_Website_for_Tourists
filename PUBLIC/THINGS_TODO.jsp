<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String location,locationid;

%>
<%
            locationid=request.getParameter("id");
           location=request.getParameter("name");
               %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Things to do in <%=location%></title>
    </head>
      <body>
        <jsp:include page="HEADER.jsp"/>
    <%!  
        String address,cno,name,id,sql,desc;
        String sun,mon,tue,wed,thu,fry,sat;
        String h24,ac,ach;
        
        ResultSet result1;

    %> 
    
        <%        
            String  days="";   

            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM THINGS_"+locationid;
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
              while(result1.next())
            {
               days="";
               name=result1.getString("T_NAME");
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
           
      

            <table border="1" cellpadding="6">
             <tr>
                 <td>
           
                     TYPE OF ACTIVITY:-<%=ac%><br>
                     NAME :-<%=name%><br>
                     ADDRESS:-<%=address%><br>
                     CONTACT NO:-<%=cno%><br>
                     DAYS AVAILABLE:-<%=days%><br>
                     ACTIVE HOURS:-<%=ach%><br>
                     DESCRIPTION:-<%=desc%><br>
                 </td> 
             </tr>
          
        <%}%>
      </table>
        <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
       
         
    </body>
</html>
