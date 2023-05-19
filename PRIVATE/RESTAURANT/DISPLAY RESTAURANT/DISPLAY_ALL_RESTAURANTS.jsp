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
            String location,locationid,sql,state;
            String address,cno,name,id;
            String desc,cui;
            String veg,nveg,vegn,bru,lun,brek,din;
            String meal,diet,cuitemp1,cuitemp2;
            int count;          


            ResultSet result1,result2;                  
            %>
       

<%   
           String url="jdbc:mysql://localhost:3306/travel";
           state=request.getParameter("state");
           sql="SELECT L_NAME,L_ID,S_NAME FROM LOCATION ORDER BY S_NAME";
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();

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
             <%while(result1.next())
            {     
                count=0;
                location=result1.getString("L_NAME");
                locationid=result1.getString("L_ID");
                state=result1.getString("S_NAME");
                sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+locationid;
                result2=s2.executeQuery(sql);
                result2.next();
                count=result2.getInt(1);
                  if(count>0)
                  {
                sql="SELECT * FROM RESTAURANTS_"+locationid;
               result2=s2.executeQuery(sql);
          %>
          <tr><th colspan="8" >RESTAURANTS IN <%=location%>,<%=state%></th></tr>
              
         
         <%  
            
             while(result2.next())
            {   
                meal=diet="";
               name=result2.getString("R_NAME");
               id=result2.getString("R_ID");
               cno=result2.getString("R_CNO");
               address=result2.getString("R_ADDRESS");
               veg=result2.getString("VEG");
               nveg=result2.getString("NVEG");
               vegn=result2.getString("VEGN");
               brek=result2.getString("BREAKFAST");
               bru=result2.getString("BRUNCH");
               lun=result2.getString("LUNCH");
               din=result2.getString("DINNER");
               cui=result2.getString("R_CUISINE");
               desc=result2.getString("R_DES");
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
         
        <%}}}%>
                         </table>

       
          <% }catch(Exception e)
          {%>
            <%=e%>    
          <%}%> 
         
    </body>
</html>
