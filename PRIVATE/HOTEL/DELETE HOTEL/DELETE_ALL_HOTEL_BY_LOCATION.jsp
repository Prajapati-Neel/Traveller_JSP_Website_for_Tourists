<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE HOTEL</title>
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
            sql="DROP TABLE HOTELS_"+id;
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            a=s1.executeUpdate(sql);
            if(a==0)
                   {
                       
                    a=-1;
                    sql="CREATE TABLE HOTELS_"+id+" (H_ID VARCHAR(8) NOT NULL ,H_NAME VARCHAR(50) NOT NULL ,H_ADDRESS VARCHAR(200) NOT NULL ,H_CNO VARCHAR(15) NOT NULL )" ;
                     a=s1.executeUpdate(sql);
                   if(a!=0)
                   {
                       %>
                       <h1>ERROR</h1>
                       <%
                   }  else
                 {
                              %>
                       <h1>ALL HOTELS SCRAPPED</h1>
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

