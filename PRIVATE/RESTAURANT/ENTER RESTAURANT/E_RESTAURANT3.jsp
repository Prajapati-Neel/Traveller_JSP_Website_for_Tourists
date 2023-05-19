<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER RESTAURANT</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
                        String state,location,locationid,sql,sql1;
                        String address,cno,name,id,temp,desc;
                        String veg,nveg,vegn,bru,lun,brek,din;
                        String meal,diet,cuitemp1,cuitemp2;
                        String rcno,rid,rname;
                        ResultSet result1,result2;
                        
           %>
          <%        
                      String  cui="";   
                        boolean a = true;
                        boolean b = true; 
                        boolean c = true;
                        int test=0;
              
                String url="jdbc:mysql://localhost:3306/travel";
                state=request.getParameter("state");
                location=request.getParameter("location");
                locationid=request.getParameter("locationid");
                address=request.getParameter("add").trim();
                name=request.getParameter("name").trim();
                cno=request.getParameter("cno");
                id=request.getParameter("id").toUpperCase();
                veg=request.getParameter("veg");
                nveg=request.getParameter("nveg");
                vegn=request.getParameter("vegn");
                desc=request.getParameter("desc").trim();
                brek=request.getParameter("brek");
                bru=request.getParameter("bru");
                lun=request.getParameter("lun");
                din=request.getParameter("din");

                temp=locationid+id;

                  if(veg!=null){veg="Y";}
                  else{veg="N";}

                  if(nveg!=null){nveg="Y";}
                  else{nveg="N";}

                  if(vegn!=null){vegn="Y";}
                  else{vegn="N";}

              
                 if(brek!=null){brek="Y";}
                 else{brek="N";}
                 
                 if(bru!=null){bru="Y";}
                 else{bru="N";} 
                 
                 if(lun!=null){lun="Y";}
                 else{lun="N";}
                 
                 if(din!=null){din="Y";}
                 else{din="N";}
                
                
                
                
                
             try
                  {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection d = DriverManager.getConnection(url,"root","");
                    Statement s1= d.createStatement();
                    Statement s2= d.createStatement();
                    sql="SELECT R_ID,R_CNO,R_NAME FROM RESTAURANTS_"+locationid;
                    sql1="SELECT C_NAME FROM CUISINES";
                    result1=s1.executeQuery(sql);
                    result2=s2.executeQuery(sql1);
                while(result2.next())
            {
               cuitemp1=result2.getString("C_NAME");
               cuitemp2=request.getParameter(cuitemp1);               
               if(cuitemp2!=null)
               {
                   cui=cui+cuitemp2+",\n";
               }
            }    
                  
                
                
                                    
                    while(result1.next())
                    {
                       rname=result1.getString("R_NAME");
                       rid=result1.getString("R_ID");
                       rcno=result1.getString("R_CNO");
                      
                        if(rname.equals(name))
                        {
                         a=false;   
                        
                          %>
                          <h1>TRY USING DIFFERENT RESTAURANT NAME</h1>
                          <%
                        }
                         if(rcno.equals(cno))
                        {                    
                            b=false; 

                          %>
                          <h1>CONTACT NO IS ALREADY REGISTERED</h1>
                          <%
                        }
                        if(rid.equals(temp))
                        {    
                           c=false;
   
                          %>
                          <h1>ID:-<%=id%> IS NOT AVAILABLE</h1>
                                  
                          <%
                        } 
                       }
                          if(a && b && c)
                          {
                            sql="INSERT INTO RESTAURANTS_"+locationid+" (R_ID,R_CNO,R_NAME,R_ADDRESS,VEG,NVEG,VEGN,BREAKFAST,BRUNCH,LUNCH,DINNER,R_CUISINE,R_DES) VALUES "
                              +"('"+temp+"','"+cno+"','"+name+"','"+address+"','"+veg+"','"+nveg+"','"+vegn+"','"+brek+"','"+bru+"','"+lun+"','"+din+"','"+cui+"','"+desc+"')";
                              test=s1.executeUpdate(sql);
                          }

                           if(test==1)
                            {

                          %>
                          <h1>RESTAURANT:-<%=name%> IS NOW PART OF RESTAURANTS_<%=locationid%> FAMILY</h1>
                                  
                          <%
                            }else
                             {
                          %>
                          <h1>OPERATION FAILED</h1>
                                  
                          <%
                                }
               sql="SELECT * FROM RESTAURANTS_"+locationid;
              result1=s1.executeQuery(sql);

            %>      
             <table border="1" cellpadding="10">
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
         
         <%  
            
             while(result1.next())
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
             <%
                 if(test==1)
                 {
                     %>
            <form method="post" action="E_RESTAURANT2.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="hidden" name="id" value="<%=locationid%>"> 
              <input type="submit" value="Enter Another Restaurant in <%=location%>">
          </form>   
          <form method="post" action="E_RESTAURANT1.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="submit" value="Enter Another Restaurant in <%=state%>">
          </form>   
          <form method="post" action="E_RESTAURANT.jsp">
              <input type="submit" value="Enter Another Restaurant">
          </form>   
                     
                <% }else
{%>
  
          <form method="post" action="E_RESTAURANT2.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="hidden" name="id" value="<%=locationid%>"> 
              <input type="submit" value="Try Again">
          </form>  

<%}
              %>
        <% }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>

                
    </body>
</html>
