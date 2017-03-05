<%-- 
    Document   : AddExpense
    Created on : Apr 2, 2016, 5:25:26 PM
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
        <br><br><br>
        <h2 style="color: brown">Add New Expense</h2>
        <br><br>
        <form name ="frm" method="post" action="AddExpenses">
            <table>
                <tr>
                <td>Expense Name : 
                <td><input type="text" name ="enm">
                </tr>
                <tr>
                <td>Price : 
                <td><input type="text" name ="price">
                </tr>
                <tr>
                <td>Date : 
                <td><input type="date" name ="date">
                </tr>
                </table>
            <br><br>
                <input type="submit" value ="Add Expense" style="background-color: burlywood">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="Cancel" onclick="history.back()" style="background-color: burlywood">
                
            </form>
    </center>
    </body>
</html>
