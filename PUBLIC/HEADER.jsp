<%@page import=" java.sql.* " %>
   
   <%!
        int count;
        String sname,lname,sql,temp,id;
        ResultSet result1,result2,result3;
    %>
        
       <a href="..\index.jsp">Traveler</a>
        <a href="..\index.jsp">Home</a>
        <a href="..\PRIVATE\verify.html">Edit</a>
 
      <%         
           
           boolean state=true;
           boolean location=true;
           boolean hotel=true;
           boolean restaurant=true; 
           boolean thing=true;
           String url="jdbc:mysql://localhost:3306/travel";
           
           
           try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
            Statement s3= d.createStatement();
           sql="SELECT COUNT(S_ID) FROM STATE";
           
  
            sql="SELECT COUNT(S_ID) FROM STATE";
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
            if(count==0)
            {
                state=false;
            }
            
               if(state)
          {
            sql="SELECT COUNT(L_ID) FROM LOCATION";
            result1=s1.executeQuery(sql);
            result1.next();
            count=result1.getInt(1);
          
            if(count==0)
             {
              location=false;
             }
            
          }
            
               if(state && location)
          {
                count=0;
            sql="SELECT L_ID FROM LOCATION";
            result1=s1.executeQuery(sql);
            while(result1.next())
             {
              id=result1.getString("L_ID");
              sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
              result2=s2.executeQuery(sql);
                result2.next();
               count=count+result2.getInt(1);
               }
                if(count==0)
              { 
                  hotel=false;
              }
                
               count=0;
               result1.beforeFirst();
             while(result1.next())
             {
              id=result1.getString("L_ID");
              sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
              result2=s2.executeQuery(sql);
                result2.next();
               count=count+result2.getInt(1);
               }
                if(count==0)
              {  
                  restaurant=false;
              }
                
                 
              count=0;
              result1.beforeFirst();
              while(result1.next())
             {
              id=result1.getString("L_ID");
              sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
              result2=s2.executeQuery(sql);
                result2.next();
               count=count+result2.getInt(1);
               }
                if(count==0)
              { 
                  thing=false;
              }
            }   
             if(state && location && (hotel || restaurant || thing))
            { 
                %>
                 <a href="STATES.jsp">Explore</a>
            <form action="SEARCH.jsp" method="post" name="search_form" onsubmit="return test()">
               <input list="state_location_list" name="state_location_list" required>
                 <datalist id="state_location_list">
          <%
              
            sql="SELECT S_NAME FROM STATE";
            result1=s1.executeQuery(sql);
            
            while(result1.next())
            {
               hotel=restaurant=thing=false;
               sname=result1.getString("S_NAME");
               sql="SELECT COUNT(L_ID) FROM LOCATION WHERE S_NAME='"+sname+"'";
               result2=s2.executeQuery(sql);
               result2.next();
               count=result2.getInt(1);
               if(count>0)
               {
               sql="SELECT L_ID FROM LOCATION WHERE S_NAME='"+sname+"'";
               result2=s2.executeQuery(sql);
                
               count=0;
               while(result2.next())
             {
              id=result2.getString("L_ID");
              sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
              result3=s3.executeQuery(sql);
              result3.next();
               count=count+result3.getInt(1);
               }
                if(count>0)
              {  
               hotel=true;
              }
                    count=0;
              result2.beforeFirst();      
               while(result2.next())
             {
              id=result2.getString("L_ID");
              sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
              result3=s3.executeQuery(sql);
                result3.next();
               count=count+result3.getInt(1);
               }
                if(count>0)
              {  
               restaurant=true;
              }
                
              count=0;
              result2.beforeFirst();
               while(result2.next())
             {
              id=result2.getString("L_ID");
              sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
              result3=s3.executeQuery(sql);
              result3.next();
               count=count+result3.getInt(1);
               }
                if(count>0)
              {  
               thing=true;
              }
               }
               if(restaurant || thing || hotel)
               {
            %>
            
          <option value="<%=sname%>">
  
       <%} }
           sql="SELECT L_ID,L_NAME,S_NAME FROM LOCATION";
           result1=s1.executeQuery(sql);

            while(result1.next())
            {
               hotel=restaurant=thing=false;

               sname=result1.getString("S_NAME");
               lname=result1.getString("L_NAME");
               id=result1.getString("L_ID");
               
              sql="SELECT COUNT(H_ID) FROM HOTELS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
              count=result2.getInt(1);
              if(count>0)
                {
                hotel=true;
                }
               
 
              sql="SELECT COUNT(R_ID) FROM RESTAURANTS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
              count=result2.getInt(1);
              if(count>0)
                {
                restaurant=true;
                }


              sql="SELECT COUNT(T_ID) FROM THINGS_"+id;
              result2=s2.executeQuery(sql);
              result2.next();
              count=result2.getInt(1);
              if(count>0)
                {
                thing=true;
                }
              if(restaurant || thing || hotel)
               {
     %>
         <option value="<%=lname%>,<%=sname%>">

       <%}}%>
      </datalist>
      <input type="submit" value="search">
      </form>
    
           <% }}catch(Exception e)
         {%>
            <%=e%>    
          <%}%>
      