<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER THINGS TODO</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
                        String state,location,locationid,sql,sql1;
                        String address,cno,name,id,temp,desc;
                        String sun,mon,tue,wed,thu,fry,sat;
                        String ach1,ach2,acm1,acm2,h24,ac,ach;
                        int iach1,iach2,iacm1,iacm2;
                        String tcno,tid,tname;
                        ResultSet result1;
                        
           %>
          <%        
                      String  days="";   
                        boolean a = true;
                        boolean b = true; 
                        boolean c = true;
                        boolean f = true;
                    int test=0;
              
                String url="jdbc:mysql://localhost:3306/travel";
                state=request.getParameter("state");
                location=request.getParameter("location");
                locationid=request.getParameter("locationid");
                address=request.getParameter("add");
                name=request.getParameter("name");
                cno=request.getParameter("cno");
                id=request.getParameter("id").toUpperCase();
                address=request.getParameter("add");
                desc=request.getParameter("desc");
                ac=request.getParameter("ac");
                h24=request.getParameter("h24");
                sun=request.getParameter("sun");
                mon=request.getParameter("mon");
                tue=request.getParameter("tue");
                wed=request.getParameter("wed");
                thu=request.getParameter("thu");
                fry=request.getParameter("fry");
                sat=request.getParameter("sat");
                ach1=request.getParameter("ach1");
                ach2=request.getParameter("ach2");
                acm1=request.getParameter("acm1");
                acm2=request.getParameter("ach2");
                
                 temp=locationid+id;

                  if(sun!=null){sun="Y";}
                  else{sun="N";}

                  if(mon!=null){mon="Y";}
                  else{mon="N";}

                  if(tue!=null){tue="Y";}
                  else{tue="N";}

                 if(wed!=null){wed="Y";}
                 else{wed="N";}
                 
                 if(thu!=null){thu="Y";}
                 else{thu="N";} 
                 
                 if(fry!=null){fry="Y";}
                 else{fry="N";}
                 
                 if(sat!=null){sat="Y";}
                 else{sat="N";}
                
                 if(h24!=null)
                 {
                     ach="24 HOURS";
                 }else
                 {
                   iach1=Integer.valueOf(ach1);
                   iach2=Integer.valueOf(ach2);
                   iacm1=Integer.valueOf(acm1);
                   iacm2=Integer.valueOf(acm2);
                  if(iach1<10)
                  {
                      ach1="0"+ach1;
                  }
                   if(iach2<10)
                  {
                      ach2="0"+ach2;
                  }
                  if(iacm1<10)
                  {
                      acm1="0"+acm1;
                  }
                  if(iach2<10)
                  {
                      acm2="0"+acm2;
                  }
                 
                   ach=ach1+":"+acm1+"-"+ach2+":"+acm2;
                  
                 }
                
                
                
             try
                  {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection d = DriverManager.getConnection(url,"root","");
                    Statement s1= d.createStatement();
                    sql="SELECT T_ID,T_CNO,T_NAME FROM THINGS_"+locationid;
                    sql1="SELECT C_NAME FROM CUISINES";
                    result1=s1.executeQuery(sql);
                  
                    if(h24==null)
                    {
                    if(iach1> iach2)
                    {
                       f=false;
                       %>
                       <h1>STARTING TIME OF ACTIVITY CAN NO BE GREATER THAN ENDING TIME</h1>
                       <%
                    }else if(iach1==iach2)
                    {
                        if(iacm1>iacm2) 
                        {
                          f=false;
                       %>
                       <h1>STARTING TIME OF ACTIVITY CAN NO BE GREATER THAN ENDING TIME</h1>
                       <%
                        }
                    }
                   }
                                    
                    while(result1.next())
                    {
                       tname=result1.getString("T_NAME");
                       tid=result1.getString("T_ID");
                       tcno=result1.getString("T_CNO");
                      
                        if(tname.equals(name))
                        {
                         a=false;   
                        
                          %>
                          <h1>TRY USING DIFFERENT THINGS TO DO NAME</h1>
                          <%
                        }
                         if(tcno.equals(cno) && !cno.equals(""))
                        {                    
                            b=false; 

                          %>
                          <h1>CONTACT NO IS ALREADY REGISTERED</h1>
                          <%
                        }
                        if(tid.equals(temp))
                        {    
                           c=false;
   
                          %>
                          <h1>ID:-<%=id%> IS NOT AVAILABLE</h1>
                                  
                          <%
                        } 
                       }
                          if(a && b && c && f)
                          {
                            sql="INSERT INTO THINGS_"+locationid+" (T_ID,T_CNO,T_NAME,T_ADDRESS,SUN,MON,TUE,WED,THU,FRY,SAT,ACTIVEHOURS,T_ACTIVITY,T_DES) VALUES "
                              +"('"+temp+"','"+cno+"','"+name+"','"+address+"','"+sun+"','"+mon+"','"+tue+"','"+wed+"','"+thu+"','"+fry+"','"+sat+"','"+ach+"','"+ac+"','"+desc+"')";
                              test=s1.executeUpdate(sql);
                          }

                           if(test==1)
                            {

                          %>
                          <h1>THINGS TO DO:-<%=name%> IS NOW PART OF THINGS_<%=locationid%> FAMILY</h1>
                                  
                          <%
                            }else
                             {
                          %>
                          <h1>OPERATION FAILED</h1>
                                  
                          <%
                                }
               sql="SELECT * FROM THINGS_"+locationid;
                    result1=s1.executeQuery(sql);

            %>      
             <h1>THINGS TO DO IN <%=location%>,<%=state%></h1>
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
  <%
                 if(test==1)
                 {
                     %>
            <form method="post" action="E_THINGS_TODO2.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="hidden" name="id" value="<%=locationid%>"> 
              <input type="submit" value="Enter Another Thing todo in <%=location%>">
          </form>   
          <form method="post" action="E_THINGS_TODO1.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="submit" value="Enter Another Thing todo in <%=state%>">
          </form>   
          <form method="post" action="E_THINGS_TODO.jsp">
              <input type="submit" value="Enter Another Thinng todo">
          </form>   
                     
                <% }else
{%>
  
          <form method="post" action="E_THINGS_TODO2.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="hidden" name="id" value="<%=locationid%>"> 
              <input type="submit" value="Try Again">
          </form>  

<%}          
           }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>

                
    </body>
</html>
