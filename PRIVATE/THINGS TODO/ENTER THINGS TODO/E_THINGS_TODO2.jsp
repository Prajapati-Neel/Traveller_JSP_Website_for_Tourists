<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER THINGS TODO</title>
                <script src="THINGS_TODO_ENTRY_FORM_TEST.js"></script>

    </head>
    <body>
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
         <%!
            String state,locationid,location,sql;
            String name,add,cno,id,desc;
            String sun,mon,tue,wed,thu,fry,sat,ac,ach;
            String ach1,ach2,acm1,acm2;
            ResultSet result1;
            int count;
            %>
       <%      
            String days="";
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
            sql="SELECT COUNT(T_ID) FROM THINGS_"+locationid;
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            if(count>0)
            {
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
               add=result1.getString("T_ADDRESS");
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
             <td><%=add%></td>
             <td><%=cno%></td>
             <td><%=days%></td>
             <td><%=ach%></td>
             <td><%=desc%></td>
         </tr>
         
                       
                       <%}%>
            </table><%}%>
          <br><br><br><br>
          <form action="E_THINGS_TODO3.jsp" method="post" name="things_todo_entry_form" onsubmit="return test()">
            <input type="hidden" name="state" value="<%=state%>" >
            <input type="hidden" name="location" value="<%=location%>" >
            <input type="hidden" name="locationid" value="<%=locationid%>" >

                <table border="1" cellpadding="6" >
                   <tr>
                    <td>
                      ID OF THINGS TO DO:-
                    </td>
                    <td>
                      <input type="text" name="id" maxlength="3" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      ACTIVITY AVAILABLE AT RESTAURANT:-
                    </td>
                    <td>
                        <select name="ac"><%  
            sql="SELECT A_NAME FROM ACTIVITY";
            result1=s1.executeQuery(sql);

             while(result1.next())
            {
               ac=result1.getString("A_NAME");
            
         %>
         <option value="<%=ac%>"> <%=ac%></option>
                        <%}
          }catch(Exception e)
          {%>
            <%=e%>    
          <%}%>
          
                    </td>
                  </tr>
                       
                  <tr>
                    <td>
                      NAME OF THINGS TO DO:-
                    </td>
                    <td>
                      <input type="text" name="name" maxlength="50" required>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      ADDRESS OF THINGS TO DO:-
                    </td>

                    <td>
                      <input type="text" name="add" maxlength="200">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      CONTACT NO OF THINGS TO DO:-
                    </td>
                    <td>
                      <input type="text" name="cno" maxlength="15">
                    </td>
                  </tr>
                  
                    <tr>
                    <td>
                     DAYS:-
                    </td>
                    <td>
                   <input type="radio" name="sun" value="sun" > SUN<br>
                   <input type="radio" name="mon" value="mon"> MON<br>
                   <input type="radio" name="tue" value="tue"> TUE<br>
                   <input type="radio" name="wed" value="wed"> WED<br>
                   <input type="radio" name="thu" value="thu"> THU<br>
                   <input type="radio" name="fry" value="fry"> FRY<br>
                   <input type="radio" name="sat" value="sat"> SAT<br>
            </td>
                  </tr>
                  
                  <tr>
                    <td>
                      ACTIVE HOURS:-
                    </td>
                    <td> 
                 <input type="radio" name="h24" value="h24"> 24 HOURS<br>
                   FROM:-
                 <select name="ach1">
                  <%for(int i=0;i<24;i++)
                {%>
                <option value="<%=i%>"><%=i%></option> 
                <%}%>
            </select>
            <select name="acm1">
                <%for(int i=0;i<60;i++)
                {%>
                <option value="<%=i%>"><%=i%></option> 
                <%}%>
            </select>
                   TO   :-
                 <select name="ach2">
                  <%for(int i=0;i<24;i++)
                {%>
                <option value="<%=i%>"><%=i%></option> 
                <%}%>
            </select>
            <select name="acm1">
                <%for(int i=0;i<60;i++)
                {%>
                <option value="<%=i%>"><%=i%></option> 
                <%}%>
            </select>
     
          
                    </td>
                  </tr>
                   <tr>
                    <td>
                      DESCRIPTION OF THINGS TO DO:-
                    </td>
                    <td>
                      <input type="text" name="desc" maxlength="150">
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
