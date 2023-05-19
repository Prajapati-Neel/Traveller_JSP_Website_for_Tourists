<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER LOCATION</title>

    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
 <%!
            String state,stateid,name,id;
            String location,locationid,locationtemp,sql,sql1,lid;
            ResultSet result1;
            

            %>
            <% 
                int a=0,b=1,c=1,f=0;
                boolean check=true;
                boolean checkid=true;
            
                String url="jdbc:mysql://localhost:3306/travel";
                state=request.getParameter("state");
                stateid=request.getParameter("stateid");
                locationtemp=request.getParameter("name");
                locationid=request.getParameter("id").toUpperCase();
              
            
       
                
                
                
                   Character tempchar2=locationtemp.charAt(0);
                   Character tempchar1;
                   location=tempchar2.toString().toUpperCase();


                   for(int i=1;i<locationtemp.length();i++)
                  {   
                      tempchar1=locationtemp.charAt(i-1);
                      tempchar2=locationtemp.charAt(i);
                    if(!(Character.isWhitespace(tempchar1)&&Character.isWhitespace(tempchar2)))
                    {
                        if(Character.isWhitespace(tempchar1))
                        {
                        location=location+tempchar2.toString().toUpperCase();
                        }else
                        {
                          location=location+tempchar2.toString().toLowerCase();
                        } 
                    }
                  }   

                
                
                
                
                
                
                
                try
                  {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection d = DriverManager.getConnection(url,"root","");
                    Statement s1= d.createStatement();
                    sql="SELECT L_NAME,L_ID FROM LOCATION WHERE S_NAME='"+state+"'";
                    result1=s1.executeQuery(sql);
                    lid=stateid+locationid;
                    sql="INSERT INTO LOCATION (L_NAME,S_ID,S_NAME,L_ID) VALUES('"+location+"','"+stateid+"','"+state+"','"+lid+"')";
                    sql1="CREATE TABLE HOTELS_"+lid+" (H_ID VARCHAR(8) NOT NULL ,H_NAME VARCHAR(50) NOT NULL ,H_ADDRESS VARCHAR(200) NOT NULL ,H_CNO VARCHAR(15) NOT NULL )" ;
                    while(result1.next())
                    {
                       name=result1.getString("L_NAME");
                       id=result1.getString("L_ID");
                       if(location.equals(name))
                       {
                           check=false;
                       }
                        if(lid.equals(id))
                       {
                           checkid=false;
                       }

                    }
                if(check && checkid)
                {
                   a=s1.executeUpdate(sql);
                   b=s1.executeUpdate(sql1);
                   sql1="CREATE TABLE RESTAURANTS_"+lid+" (R_ID VARCHAR(8) NOT NULL ,R_NAME VARCHAR(50) NOT NULL ,R_ADDRESS VARCHAR(200) NOT NULL ,R_CNO VARCHAR(15) NOT NULL ,"
                  +"VEG VARCHAR(1) NOT NULL ,NVEG VARCHAR(1) NOT NULL ,VEGN VARCHAR(1) NOT NULL ,"
                  +"BREAKFAST VARCHAR(1) NOT NULL ,BRUNCH VARCHAR(1) NOT NULL ,LUNCH VARCHAR(1) NOT NULL ,DINNER VARCHAR(1) NOT NULL ,"
                  +"R_CUISINE VARCHAR(50), R_DES VARCHAR(150) )" ;
                  c=s1.executeUpdate(sql1);
                  sql1="CREATE TABLE THINGS_"+lid+" (T_ID VARCHAR(8) NOT NULL ,T_NAME VARCHAR(50) NOT NULL ,T_ADDRESS VARCHAR(200) ,T_CNO VARCHAR(15) ,"
                       +"SUN VARCHAR(1) NOT NULL ,MON VARCHAR(1) NOT NULL ,TUE VARCHAR(1) NOT NULL ,"
                       +"WED VARCHAR(1) NOT NULL ,THU VARCHAR(1) NOT NULL ,FRY VARCHAR(1) NOT NULL ,SAT VARCHAR(1) NOT NULL ,"
                       +"ACTIVEHOURS VARCHAR(11) NOT NULL ,"
                       +"T_ACTIVITY VARCHAR(20) NOT NULL , T_DES VARCHAR(150) )" ;
                 f=s1.executeUpdate(sql1);  
                }else
                {  
                    if(!check)
               {
                  %>
              <h1>WE ALREADY KNOW ABOUT THIS LOCATION</h1>         
              <%}
               if(!checkid)
                {  %>
              <h1>THINK ABOUT OTHER LOCATION ID AND THAN TRY AGAIN</h1>         
             <%
               }
             }  if(a==1 && b==0 && c==0 && f==0)
            {            
           %>
           <h1>LOCATION:-<%=location%> AND LOCATION ID:-<%=locationid%> ARE IN TABLE</h1>         
           <%        
               sql="SELECT * FROM LOCATION";
              result1=s1.executeQuery(sql);
%>
            <table border="1" cellpadding="10">
         <tr>
             <th>ID OF STATE</th>
             <th>NAME OF STATE</th>
             <th>ID OF LOCATION</th>
             <th>NAME OF LOCATION</th>
         </tr>   
         
         <%  while(result1.next())
            {
                state=result1.getString("S_NAME");
                stateid=result1.getString("S_ID");
                name=result1.getString("L_NAME");
                id=result1.getString("L_ID");
         %>
            

         <tr>
              <td><%=stateid%></td>
              <td><%=state%></td>
              <td><%=id%></td>
              <td><%=name%></td>
            
         </tr>
         
                       
                       <%}%>
                       </table>
          <form method="post" action="E_LOCATION1.jsp">
              <input type="hidden" name="name" value="<%=state%>"> 
              <input type="submit" value="Enter Another Location in <%=state%>">
          </form>   
          <form method="post" action="E_LOCATION.jsp">
              <input type="submit" value="Enter Another Location">
          </form>   
          
            <% }
               else
               {%>
           <h1>OPERATION FAILED</h1>         
            <form method="post" action="E_LOCATION1.jsp">
                <input type="hidden" name="name" value="<%=state%>">
             <input type="submit" value="Try Again">
                </form> 
           <%}
    }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
          



    </body>
</html>
