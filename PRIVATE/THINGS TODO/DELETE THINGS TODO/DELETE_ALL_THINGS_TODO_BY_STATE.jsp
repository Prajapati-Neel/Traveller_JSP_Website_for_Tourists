<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE THINGS TODO</title>
    </head>
    <body> 
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String name,sql,id,state;
            ResultSet result1;
            %>
            
 <%   
           int a=1;
           state=request.getParameter("state");
           String url="jdbc:mysql://localhost:3306/travel";
           sql="SELECT L_ID FROM LOCATION WHERE S_NAME='"+state+"'";
               
          try
          {
            boolean testfordrop=true;
            boolean testforcreate=true;
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            Statement s2= d.createStatement();
            result1=s1.executeQuery(sql);
            while(result1.next())
                {  a=1;
                   id=result1.getString("L_ID");
                   sql="DROP TABLE THINGS_"+id;
                   a=s2.executeUpdate(sql);
                   if(a==0)
                   {
                       
                     a=-1;
                     sql="CREATE TABLE THINGS_"+id+" (T_ID VARCHAR(8) NOT NULL ,T_NAME VARCHAR(50) NOT NULL ,T_ADDRESS VARCHAR(200) ,T_CNO VARCHAR(15) ,"
                          +"SUN VARCHAR(1) NOT NULL ,MON VARCHAR(1) NOT NULL ,TUE VARCHAR(1) NOT NULL ,"
                          +"WED VARCHAR(1) NOT NULL ,THU VARCHAR(1) NOT NULL ,FRY VARCHAR(1) NOT NULL ,SAT VARCHAR(1) NOT NULL ,"
                          +"ACTIVEHOURS VARCHAR(11) NOT NULL ,"
                          +"T_ACTIVITY VARCHAR(20), T_DES VARCHAR(150) )" ;
                         a=s2.executeUpdate(sql);
                   if(a!=0)
                   {
                       testforcreate=false;
                   }
                   
                   } else
                 {
                   testfordrop=false;
                    }
                   }
                 
           if(testfordrop)
                   {   
                if(!testforcreate)
                   {
                       %>
                       <h1>ERROR</h1>
                       <%
                   } else
                 {
                              %>
                       <h1>ALL THINGS TODO SCRAPPED</h1>
                       <%
                    }
                   } else
                 {
                              %>
                       <h1>ERROR</h1>
                       <%
                    }
    
           
                 }
               catch(Exception e)
                {%>
                  <%=e%>    
                <%}%>  
                
                
                
             