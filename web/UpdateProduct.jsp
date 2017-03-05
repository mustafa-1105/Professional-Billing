<%-- 
    Document   : UpdateProduct
    Created on : Mar 27, 2016, 2:08:36 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="professionalbean.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="billingStyles.css">
    </head>
    <body>
        <%
                String pnm = request.getParameter("pnm");
                double purchase=Double.parseDouble(request.getParameter("purchase"));
                double selling=Double.parseDouble(request.getParameter("selling"));
                double stock=Double.parseDouble(request.getParameter("stock"));
                String unit = request.getParameter("unit");
                
            %>
    <center>
        <br><br><br><br>
            <form name ="frm" method="post" action="Update.jsp?pnm=<%=pnm%>">
                <h3 style="color: brown">Product Name : <%=pnm%></h3>
                <br><br>
                Purchase Price : <input type="text" name ="purchase" value ="<%=purchase%>">
                Selling Price : <input type="text" name ="selling" value ="<%=selling%>">
                Stock : <input type="text" name ="stock" value ="<%=stock%>">
                Unit : <input type="text" name ="unit" value ="<%=unit%>">
                <br><br><br>
                <input type="submit" value ="Update Product" style="background-color: burlywood">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="Cancel" onclick="history.back()" style="background-color: burlywood">
            </form>
    </center>
    </body>
</html>
