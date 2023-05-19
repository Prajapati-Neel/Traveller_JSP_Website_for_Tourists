<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE RESTAURANT</title>
    </head>
    <body> 
        <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>
        <%!
            String name,sql,id;
            ResultSet result1;
            %>
            
 <%   
           int a=1;
           String url="jdbc:mysql://localhost:3306/travel";
           sql="SELECT L_ID FROM LOCATION";
               
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
                   sql="DROP TABLE RESTAURANTS_"+id;
                   a=s2.executeUpdate(sql);
                   if(a==0)
                   {
                       
                     a=-1;
                       sql="CREATE TABLE RESTAURANTS_"+id+" (R_ID VARCHAR(8) NOT NULL ,R_NAME VARCHAR(50) NOT NULL ,R_ADDRESS VARCHAR(200) NOT NULL ,R_CNO VARCHAR(15) NOT NULL ,"
                          +"VEG VARCHAR(1) NOT NULL ,NVEG VARCHAR(1) NOT NULL ,VEGN VARCHAR(1) NOT NULL ,"
                          +"BREAKFAST VARCHAR(1) NOT NULL ,BRUNCH VARCHAR(1) NOT NULL ,LUNCH VARCHAR(1) NOT NULL ,DINNER VARCHAR(1) NOT NULL ,"
                          +"R_CUISINE VARCHAR(50), R_DES VARCHAR(150) )" ;
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
                       <h1>ALL RESTAURANTS SCRAPPED</h1>
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
                
                
                
             