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
        <title>Restaurnts in <%=location%></title>
    </head>
      <body>
       <jsp:include page="HEADER.jsp"/>
    <%!  
        String address,cno,name,sql;
        String veg,nveg,vegn,bru,lun,brek,din;
        String meal,diet,cuitemp1,cuitemp2,cui,desc;

        ResultSet result1;

    %> 
    
        <% 
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM RESTAURANTS_"+locationid;
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            while(result1.next())
            {   
                meal=diet="";
               name=result1.getString("R_NAME");
               cno=result1.getString("R_CNO");
               address=result1.getString("R_ADDRESS");
               veg=result1.getString("VEG");
               nveg=result1.getString("NVEG");
               vegn=result1.getString("VEGN");
               brek=result1.getString("BREAKFAST");
               bru=result1.getString("BRUNCH");
               lun=result1.getString("LUNCH");
               din=result1.getString("DINNER");
               cui=result1.getString("R_CUISINE");
               desc=result1.getString("R_DES");
               if(veg.equals("Y"))
               {
                diet="Vegetarian,\n";   
               }
                if(nveg.equals("Y"))
               {
                diet=diet+"Non-Vegetarian\n";  
               } if(vegn.equals("Y"))
               {
                diet=diet+"Vegan"; 
               }
               


               if(brek.equals("Y"))
               {
                meal="Breakfast,\n";   
               }
                if(bru.equals("Y"))
               {
                meal=meal+"Brunch,\n";  
               } if(lun.equals("Y"))
               {
                meal=meal+"Lunch,\n"; 
               } if(din.equals("Y"))
               {
                meal=meal+"Dinner"; 
               }
                if(desc.equals("null"))
               {
                   desc=" ";
               }
            
        %>
           
      

            <table border="1" cellpadding="6">
             <tr>
                 <td>
             NAME OF RESTAURANT:-<%=name%></br>
             ADDRESS:-<%=address%></br>
             CONTACT NO:-<%=cno%></br>
             DIETARY OPTIONS:-<%=diet%></br>
             MEAL OPTIONS:-<%=meal%></br>
             CUISINES:-<%=cui%></br>
             DESCRIPTION:-<%=desc%></br>
         
      
        </tr>
         
        <%}%>
      </table>
        <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
       
         
    </body>
</html>
