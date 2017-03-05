<%-- 
    Document   : addItem
    Created on : Mar 26, 2016, 9:15:30 PM
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
        <h2 style="color: brown">Add New Item</h2>
        <br>
        <form name ="frm" method="post" action="AddItem" >
                Product Name : <input type="text" name ="pnm" value ="">
                <br><br><br><br>
                Purchase Price : <input type="text" name ="purchase" value ="">
                Selling Price : <input type="text" name ="selling" value ="">
                Stock : <input type="text" name ="stock" value ="">
                Unit : <input type="text" name ="unit" value ="">
                <br><br><br>
                <input type="submit" value ="Add Product" style="background-color: burlywood">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="Cancel" onclick="history.back()" style="background-color: burlywood">
            </form>
    </center>
    </body>
</html>
