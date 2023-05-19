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
            String sql,id;
            %>
            
 <%   
           int a=1;
           String url="jdbc:mysql://localhost:3306/travel";
           id=request.getParameter("id");
            sql="DROP TABLE THINGS_"+id;
               
          try
          {
      
            Class.forName("com.mysql.jdbc.Driver");
            Connection d = DriverManager.getConnection(url,"root","");
            Statement s1= d.createStatement();
            a=s1.executeUpdate(sql);
            if(a==0)
                   {
                       
                    a=-1;
                   sql="CREATE TABLE THINGS_"+id+" (T_ID VARCHAR(8) NOT NULL ,T_NAME VARCHAR(50) NOT NULL ,T_ADDRESS VARCHAR(200) ,T_CNO VARCHAR(15) ,"
                          +"SUN VARCHAR(1) NOT NULL ,MON VARCHAR(1) NOT NULL ,TUE VARCHAR(1) NOT NULL ,"
                          +"WED VARCHAR(1) NOT NULL ,THU VARCHAR(1) NOT NULL ,FRY VARCHAR(1) NOT NULL ,SAT VARCHAR(1) NOT NULL ,"
                          +"ACTIVEHOURS VARCHAR(11) NOT NULL ,"
                          +"T_ACTIVITY VARCHAR(20), T_DES VARCHAR(150) )" ;
                                      a=s1.executeUpdate(sql);
                   if(a!=0)
                   {
                       %>
                       <h1>ERROR</h1>
                       <%
                   }  else
                 {
                              %>
                       <h1>ALL THINGS TO DO SCRAPPED</h1>
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

