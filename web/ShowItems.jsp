<%-- 
    Document   : showItems
    Created on : Mar 26, 2016, 9:14:59 PM
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
    <center>
        <br><br><br>
        <h3 style="color: brown">All Products</h3>
        <br>
        <table width="1000px" cellspacing="0" border="1" bordercolor="black">    
            <center>
                <tr bgcolor="tan">
                    <th>Product Number
                    <th>Products
                    <th>Purchase Price
                    <th>Selling Price
                    <th>Stock
                    <th>Unit
                    <th>Action
                </tr>
            </center>

            <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                int no=0;
                String nm,unit;
                String id=String.valueOf(session.getAttribute("usr_id"));
                double purchase,selling,stock;

                try {
                    
                    DBConnector dbc = new DBConnector();
                    con = dbc.getDbconnection();

                    pst=con.prepareStatement("select * from products where usr_id=?;");
                    pst.setString(1,id);
                    
                    rs=pst.executeQuery();

                    while(rs.next()) {

                        no=no+1;
                        nm=rs.getString("prod_name");
                        purchase=rs.getDouble("purchase_price");
                        selling=rs.getDouble("selling_price");
                        stock=rs.getDouble("stock");            
                        unit=rs.getString("unit");
            %>

            <tr>
                <td><%=no%>
                <td><%=nm%>
                <td><%=purchase%>
                <td><%=selling%>
                <td><%=stock%>
                <td><%=unit%>
                <td><a href="DeleteProduct.jsp?pnm=<%=nm%>">Delete</a> | 
                    <a href="UpdateProduct.jsp?pnm=<%=nm%>&purchase=<%=purchase%>&selling=<%=selling%>&stock=<%=stock%>&unit=<%=unit%>">Update</a>                              
            </tr>

            <%
                    }

                    con.close();
                }
            catch(Exception e) {
                out.println(e);
              }
            %>
    </table>
    <br>
    </center>
    </body>
</html>
