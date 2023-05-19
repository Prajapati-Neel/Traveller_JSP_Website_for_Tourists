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
            String sql,id;
            %>
            
 <%   
           int a=1;
           String url="jdbc:mysql://localhost:3306/travel";
           id=request.getParameter("id");
            sql="DROP TABLE RESTAURANTS_"+id;
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            a=s1.executeUpdate(sql);
            if(a==0)
                   {
                       
                    a=-1;
                        sql="CREATE TABLE RESTAURANTS_"+id+" (R_ID VARCHAR(8) NOT NULL ,R_NAME VARCHAR(50) NOT NULL ,R_ADDRESS VARCHAR(200) NOT NULL ,R_CNO VARCHAR(15) NOT NULL ,"
                          +"VEG VARCHAR(1) NOT NULL ,NVEG VARCHAR(1) NOT NULL ,VEGN VARCHAR(1) NOT NULL ,"
                          +"BREAKFAST VARCHAR(1) NOT NULL ,BRUNCH VARCHAR(1) NOT NULL ,LUNCH VARCHAR(1) NOT NULL ,DINNER VARCHAR(1) NOT NULL ,"
                          +"R_CUISINE VARCHAR(50), R_DES VARCHAR(150) )" ;
                                     a=s1.executeUpdate(sql);
                   if(a!=0)
                   {
                       %>
                       <h1>ERROR</h1>
                       <%
                   }  else
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
                   
                }     catch(Exception e)
                {%>
                  <%=e%>    
                <%}%>  

