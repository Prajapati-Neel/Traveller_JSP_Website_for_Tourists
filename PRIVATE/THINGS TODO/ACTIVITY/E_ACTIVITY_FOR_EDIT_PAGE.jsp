<%@page import=" java.sql.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ENTER ACTIVITY</title>
    </head>
    <body>
         <a href="..\..\EDIT.jsp" >TO MAIN EDIT PAGE</a>

        <form action="E_ACTIVITY.jsp" method="POST">
            <table border="1" cellpadding="6">
                <tr>
                    <td>
                        ENTER ACTIVITY:-
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="activity" >
                       
                    </td>
                </tr>
                  <tr>
                    <td colspan="2">
                        <input type="submit" value="ENTER" >
                       
                    </td>
                </tr>
            </table>
            </form>
           
    </body>
</html>
