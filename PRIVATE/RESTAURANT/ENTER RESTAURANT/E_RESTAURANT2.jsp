<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER RESTAURANT</title>
      	<script src="RESTAURANT_ENTRY_FORM_TEST.js"></script>

    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
         <%!
            String state,locationid,location,sql;
            String name,add,cno,id,cui,desc;
            String veg,nveg,vegn,bru,din,lun,brek,diet,meal;
            ResultSet result1;
            int count;
            %>
       <%      
               
            state=request.getParameter("state");
            locationid=request.getParameter("id");
          

           String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT L_NAME FROM LOCATION WHERE L_ID='"+locationid+"'";
             try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1 = d.createStatement();
            result1=s1.executeQuery(sql);
            result1.next();
            location=result1.getString("L_NAME");
            sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+locationid;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            if(count>0)
            {
            sql="SELECT * FROM RESTAURANTS_"+locationid;
            result1=s1.executeQuery(sql);

            %>      
            <h1>RESTAURANTS IN <%=location%>,<%=state%></h1>
            <table border="1" cellpadding="10">
             <tr>
             <th>ID</th>
             <th>NAME OF HOTEL</th>
             <th>ADDRESS</th>
             <th>CONTACT NO</th>
             <th>DIETARY OPTIONS</th>
             <th>MEAL OPTIONS</th>
             <th>CUISINES</th>
             <th>DESCRIPTION</th>
         </tr>   
         
         <%  
            
             while(result1.next())
            {    
               meal=diet="";
               name=result1.getString("R_NAME");
               id=result1.getString("R_ID");
               cno=result1.getString("R_CNO");
               add=result1.getString("R_ADDRESS");
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
                    meal=meal+"Lunch"; 
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
             <td><%=add%></td>
             <td><%=cno%></td>
             <td><%=diet%></td>
             <td><%=meal%></td>
             <td><%=cui%></td>
             <td><%=desc%></td>
         </tr>
         
                       
                       <%}%>
            </table><%}%>
          <br><br><br><br>
          <form action="E_RESTAURANT3.jsp" method="post" name="restaurant_entry_form" onsubmit="return test()">
            <input type="hidden" name="state" value="<%=state%>" >
            <input type="hidden" name="location" value="<%=location%>" >
            <input type="hidden" name="locationid" value="<%=locationid%>" >

                <table border="1" cellpadding="6">
                   <tr>
                    <td>
                      ID OF RESTAURANT:-
                    </td>
                    <td>
                      <input type="text" name="id" maxlength="3" size="1" required>
                    </td>
                  </tr>
                    <tr>
                    <td>
                      NAME OF RESTAURANT:-
                    </td>
                    <td>
                      <input type="text" name="name" maxlength="50"  required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      ADDRESS OF RESTAURANT:-
                    </td>

                    <td>
                      <textarea name="add" rows="5" cols="19" maxlength="200" required></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      CONTACT NO OF RESTAURANT:-
                    </td>
                    <td>
                      <input type="text" name="cno" maxlength="15" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      DESCRIPTION OF RESTAURANT:-
                    </td>
                    <td>
                      <input type="text" name="desc" maxlength="150">
                    </td>
                  </tr>
                    <tr>
                    <td>
                     DIETARY OPTIONS:-
                    </td>
                    <td>
                   <input type="radio" name="veg" value="veg" > VEGETARIAN<br>
                   <input type="radio" name="nveg" value="nveg"> NON-VEGETARIAN<br>
                   <input type="radio" name="vegn" value="vegn"> VEGAN<br>
              </td>
                  </tr>
                  <tr>
                    <td>
                      MEAL OPTIONS:-
                    </td>
                    <td>
                   <input type="radio" name="bre" value="bre"> BREAKFAST<br>
                   <input type="radio" name="bru" value="bru"> BRUNCH<br>
                   <input type="radio" name="lun" value="lun"> LUNCH<br>
                   <input type="radio" name="din" value="din"> DINNER<br>
            </td>
                  </tr>
                  <tr>
                    <td>
                      CUISINES AVAILABLE AT RESTAURANT:-
                    </td>
                    <td>  <%  
            sql="SELECT C_NAME FROM CUISINES";
            result1=s1.executeQuery(sql);

             while(result1.next())
            {
               cui=result1.getString("C_NAME");
            
         %>
             <input type="radio" name="<%=cui%>" value="<%=cui%>"> <%=cui%><br>
                        <%}
          }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
          
                    </td>
                  </tr>
                     
                  <tr>
                    <td colspan="2" align="right">
                     <input type="reset" value="RESET">
                     
                     <input type="submit" value="ENTER">
                    </td>
                  </tr>
                    </table>
         
                 </form>

    </body>
</html>
