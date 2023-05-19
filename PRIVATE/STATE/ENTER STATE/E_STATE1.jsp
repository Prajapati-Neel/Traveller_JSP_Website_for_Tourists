<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER STATE</title>
    </head>
    <body>
     
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>

        <%!
            String statetemp,state,stateid,sql,name,id;
            ResultSet result1;
        %>
 <%       
            boolean check=true;boolean checkid=true;
            int a=0;
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT * FROM STATE";
            statetemp=request.getParameter("name");
            stateid=request.getParameter("id").toUpperCase();
            
    

       Character tempchar2=statetemp.charAt(0);
       Character tempchar1;
       state=tempchar2.toString().toUpperCase();
       
  
       for(int i=1;i<statetemp.length();i++)
      {   
          tempchar1=statetemp.charAt(i-1);
          tempchar2=statetemp.charAt(i);
        if(!(Character.isWhitespace(tempchar1)&&Character.isWhitespace(tempchar2)))
        {
            if(Character.isWhitespace(tempchar1))
            {
            state=state+tempchar2.toString().toUpperCase();
            }else
            {
              state=state+tempchar2.toString().toLowerCase();
            } 
        }
      }   
            
            
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            result1=s1.executeQuery(sql);
            sql="INSERT INTO STATE (S_NAME,S_ID) VALUES('"+state+"','"+stateid+"')";
            while(result1.next())
            {
               name=result1.getString("S_NAME");
               id=result1.getString("S_ID");
               if(state.equals(name))
               {
                   check=false;
               }
                if(stateid.equals(id))
               {
                   checkid=false;
               }
               
            }
            if(check && checkid)
            {
               a=s1.executeUpdate(sql);
     
            }else
            {
               if(!check)
               {
                  %>
              <h1>WE KNOW ALREADY KNOW ABOUT THIS STATE</h1>         
              <%}
               if(!checkid)
                {  %>
              <h1>THINK ABOUT OTHER STATE ID AND THAN TRY AGAIN</h1>         
             <%
               }
             }
            
           if(a==1)
            {            
           %>
           <h1>STATE:-<%=state%> AND STATEID:-<%=stateid%> ARE IN TABLE</h1>         
           <%        
               sql="SELECT * FROM STATE";
              result1=s1.executeQuery(sql);
%>
            <table border="1" cellpadding="10">
             <tr>
             <th>NAME OF STATE</th>
             <th>ID</th>
         </tr>   
         
         <%  while(result1.next())
            {
               name=result1.getString("S_NAME");
               id=result1.getString("S_ID");
         %>
            

         <tr>
             <td><%=id%></td>
             <td><%=name%></td>
         </tr>
         
                       
                       <%}%>
                       </table>
                <form method="post" action="E_STATE.jsp">
              <input type="submit" value="Enter Another State">
          </form>  
            <% }
               else
               {%>
           <h1>INSERT OPERATION FAILED</h1>       
           <form method="post" action="E_STATE.jsp">
             <input type="submit" value="Try Again">
          </form>  
           <%}
    }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
         



    </body>
</html>
