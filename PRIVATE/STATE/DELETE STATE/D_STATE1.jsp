<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE STATE</title>
    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String name,id,sql,lid;
            ResultSet result1;
            int count;
            %>
       <%      
             int a=0,b,c;
             id=request.getParameter("id");
            String url="jdbc:mysql://localhost:3306/travel";
            sql="SELECT S_NAME FROM STATE WHERE S_ID='"+id+"'";
            
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();

            result1=s1.executeQuery(sql);
            if(result1.next())
            {
            name=result1.getString("S_NAME");
            sql="DELETE FROM STATE WHERE S_ID='"+id+"'";
               a=s1.executeUpdate(sql);
                if(a==1)
                {
                sql="SELECT L_ID FROM LOCATION WHERE S_ID='"+id+"'";
                result1=s1.executeQuery(sql);
                while(result1.next())
                {    
                    b=0;
                
                    lid=result1.getString("L_ID");
                    sql="DELETE FROM LOCATION WHERE L_ID='"+lid+"'";
                    b=s2.executeUpdate(sql);
                    if(b==1)
                    {
                
                        c=1;   
                   
                    sql="DROP TABLE HOTELS_"+lid;
                    c=s2.executeUpdate(sql);
                    
                    if(c==1)
                    {
                  %>
                <h1> MANUALLY DELETE TABLE HOTELS_<%=lid%></h1>  
                <%      
                  } 
                   

                
                
                        c=1;   
                   
                    sql="DROP TABLE RESTAURANTS_"+lid;
                    c=s2.executeUpdate(sql);
                    if(c==1)
                    {
                  %>
                <h1> MANUALLY DELETE TABLE RESTAURANTS_<%=lid%></h1>  
                <%      
                  }
            
                       c=1;   
                   
                    sql="DROP TABLE THINGS_"+lid;
                    c=s2.executeUpdate(sql);
                    if(c==1)
                    {
                  %>
                <h1> MANUALLY DELETE TABLE THINGS_<%=lid%></h1>  
                <%      
                  }



           }  
        }
               
                  %>
                <h1><%=name%> is no longer with us </h1>  
                <%  
                
                sql="SELECT count(S_ID) FROM STATE";
                result1=s1.executeQuery(sql);
                result1.next();
                count=result1.getInt(1);
                if(count>0)
                {
                sql="SELECT * FROM STATE";
                result1=s1.executeQuery(sql);
                %>
                    <table border="1" cellpadding="10">
             <tr>
             <th>NAME OF STATE</th>
             <th>ID</th>
         </tr>   
         
         <%  
            
             while(result1.next())
            {
               name=result1.getString("S_NAME");
               id=result1.getString("S_ID");
         %>
            

         <tr>
             <td><%=name%></td>
             <td><%=id%></td>
         </tr>
         
                       
                       <%}%>
                       </table>
          <form method="post" action="D_STATE.jsp">
              <input type="submit" value="Delete Another State">
          </form>
                <%}}
                else
                {
                 %>
                <h1>CAN NOT DELETE STATE :-<%=name%></h1>  
                 <form method="post" action="D_STATE.jsp">
             <input type="submit" value="Try Again">
                </form>  
                <%   
                }
            }
            else
            {%>
            <h1>ID=<%=id%> is not associated with any state</h1>    
           <form method="post" action="D_STATE.jsp">
             <input type="submit" value="Try Again">
                </form> 
            <%}%>
            
            
            <%}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
          
    </body>
</html>
   