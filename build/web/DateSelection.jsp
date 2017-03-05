<%-- 
    Document   : EndDay
    Created on : Apr 2, 2016, 5:25:44 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="billingStyles.css">
    </head>
    <body>
    <center>
        <br><br>
        <h3 style="color: brown">Select Date</h3>
        <table width="300px">
        <form name="frm" method="post" action="BusinessStatistics.jsp">
            <tr>
                <th>To</th>
                <th>From</th>
            </tr>
            <tr>
                <td><input type="date" name="to"></td>
                <td><input type="date" name="from"></td>
            </tr>
            </table>
        <br><br><br>
            <center>
                <input type="submit" value="Get Stats" style="background-color: burlywood">
            </center>
            
        </form>
            
    </center>
    </body>
</html>
