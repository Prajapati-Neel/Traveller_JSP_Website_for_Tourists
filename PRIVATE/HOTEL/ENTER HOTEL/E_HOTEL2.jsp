<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER HOTEL</title>
        <script src="HOTEL_ENTRY_FORM_TEST.js"></script>

    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
         <%!
            String state,locationid,location,sql;
            String name,add,cno,id;
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
            sql="SELECT COUNT(H_ID) FROM HOTELS_"+locationid;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            if(count>0)
            {
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
               add=result1.getString("H_ADDRESS");
         %>
            

         <tr>
              <td><%=id%></td>
             <td><%=name%></td>
             <td><%=add%></td>
             <td><%=cno%></td>
         </tr>
         
                       
                       <%}%>
                       </table>
            <%}}catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
          <br><br><br><br>
          <form action="E_HOTEL3.jsp" method="post" name="hotel_entry_form" onsubmit="return test()">
            <input type="hidden" name="state" value="<%=state%>" >
            <input type="hidden" name="location" value="<%=location%>" >
            <input type="hidden" name="locationid" value="<%=locationid%>" >

                <table border="1" cellpadding="6">
                   <tr>
                    <td>
                      ID OF HOTEL:-
                    </td>
                    <td>
                      <input type="text" name="id" maxlength="3" required>
                    </td>
                  </tr>
                    <tr>
                    <td>
                      NAME OF HOTEL:-
                    </td>
                    <td>
                      <input type="text" name="name" maxlength="50" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      ADDRESS OF HOTEL:-
                    </td>

                    <td>
                      <textarea name="add" rows="5" cols="19" maxlength="200" required></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      CONTACT NO OF HOTEL:-
                    </td>
                    <td>
                      <input type="text" name="cno" maxlength="15" required>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2" align="right">
                      <input type="submit" value="ENTER">
                    </td>
                  </tr>

                </table> 
                 </form>  
          

    </body>
</html>
