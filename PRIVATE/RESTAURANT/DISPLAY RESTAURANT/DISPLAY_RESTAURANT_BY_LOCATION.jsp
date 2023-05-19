<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISPLAY RESTAURANT</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
    <%!  
        String address,cno,name,id,locationid,sql;
        String veg,nveg,vegn,bru,lun,brek,din;
        String meal,diet,cuitemp1,cuitemp2,cui,desc;

        ResultSet result1;

    %> 
    
        <% 
            locationid = request.getParameter("id");
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM RESTAURANTS_"+locationid;
            
               
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            
      
%>
            <table border="1" cellpadding="6">
                <tr>
             <th>ID</th>
             <th>NAME OF RESTAURANT</th>
             <th>ADDRESS</th>
             <th>CONTACT NO</th>
             <th>DIETARY OPTIONS</th>
             <th>MEAL OPTIONS</th>
             <th>CUISINES</th>
             <th>DESCRIPTION</th>
         </tr> 
           <% while(result1.next())
            {   
                meal=diet="";
               name=result1.getString("R_NAME");
               id=result1.getString("R_ID");
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
            

         <tr>
              <td><%=id%></td>
             <td><%=name%></td>
             <td><%=address%></td>
             <td><%=cno%></td>
             <td><%=diet%></td>
             <td><%=meal%></td>
             <td><%=cui%></td>
             <td><%=desc%></td>
         </tr>
         
        <%}%>
                         </table>

       
          <% }catch(Exception e)
          {%>
            <%=e%>    
          <%}%> 
         
    </body>
</html>
