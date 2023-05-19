<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER HOTEL</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
                      String state,location,locationid,sql;
                        String address,cno,name,id,temp;
                        String hcno,hid,hname;
                        ResultSet result1;
                        
           %>
          <%            
                        boolean a = true;
                        boolean b = true; 
                        boolean c = true;
                        int test=0;
              
                String url="jdbc:mysql://localhost:3306/travel";
                state=request.getParameter("state");
                location=request.getParameter("location");
                locationid=request.getParameter("locationid");
                address=request.getParameter("add");
                name=request.getParameter("name");
                cno=request.getParameter("cno");
                id=request.getParameter("id").toUpperCase();
                temp=locationid+id;
                  try
                  {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection d = DriverManager.getConnection(url,"root","");
                    Statement s1= d.createStatement();
                    sql="SELECT H_ID,H_CNO,H_NAME FROM HOTELS_"+locationid;
                    result1=s1.executeQuery(sql);
                    
                    
                    
                    while(result1.next())
                    {
                       hname=result1.getString("H_NAME");
                       hid=result1.getString("H_ID");
                       hcno=result1.getString("H_CNO");
                      
                        if(hname.equals(name))
                        {
                         a=false;   
                        
                          %>
                          <h1>TRY USING DIFFERENT HOTEL NAME</h1>
                          <%
                        }
                         if(hcno.equals(cno))
                        {                    
                            b=false; 

                          %>
                          <h1>CONTACT NO IS ALREADY REGISTERED</h1>
                          <%
                        }
                        if(hid.equals(temp))
                        {    
                           c=false;
   
                          %>
                          <h1>ID:-<%=id%> IS NOT AVAILABLE</h1>
                                  
                          <%
                        } 
                       }
                          if(a && b && c)
                          {
                            sql="INSERT INTO HOTELS_"+locationid+" (H_ID,H_CNO,H_NAME,H_ADDRESS) VALUES ('"+temp+"','"+cno+"','"+name+"','"+address+"')";
                          test=s1.executeUpdate(sql);
                          }

                           if(test==1)
                            {

                          %>
                          <h1>HOTEL:-<%=name%> IS NOW PART OF HOTELS_<%=locationid%> FAMILY</h1>
                                  
                          <%
                            }else
                             {
                          %>
                          <h1>OPERATION FAILED</h1>
                                  
                          <%
                                }
               sql="SELECT * FROM HOTELS_"+locationid;
              result1=s1.executeQuery(sql);

            %>      
            <h1>HOTELS IN <%=location%>,<%=state%></h1>
            <table border="1" cellpadding="10">
             <tr>
             <th>ID</th>
             <th>NAME OF HOTEL</th>
             <th>ADDRESS</th>
             <th>CONTACT NO</th>
         </tr>   
         
         <%  
            
             while(result1.next())
            {
               name=result1.getString("H_NAME");
               id=result1.getString("H_ID");
               cno=result1.getString("H_CNO");
               address=result1.getString("H_ADDRESS");
         %>
            

         <tr>
              <td><%=id%></td>
             <td><%=name%></td>
             <td><%=address%></td>
             <td><%=cno%></td>
         </tr>
         
                       
                       <%}%>
                       </table>
    <%
                 if(test==1)
                 {
                     %>
            <form method="post" action="E_HOTEL2.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="hidden" name="id" value="<%=locationid%>"> 
              <input type="submit" value="Enter Another Hotel in <%=location%>">
          </form>   
          <form method="post" action="E_HOTEL1.jsp">
              <input type="hidden" name="state" value="<%=state%>"> 
              <input type="submit" value="Enter Another Hotel in <%=state%>">
          </form>   
          <form method="post" action="E_HOTEL.jsp">
              <input type="submit" value="Enter Another Hotel">
          </form>   
                     
                <% }else
{%>
  
          <form method="post" action="E_HOTEL2.jsp">
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
