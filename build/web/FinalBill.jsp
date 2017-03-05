<%-- 
    Document   : FinalBill
    Created on : Apr 5, 2016, 12:20:13 PM
    Author     : admin
--%>

<%@page import="professionalbean.DBConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="billingStyles.css">
    </head>
    <body>
        <%
            String date=request.getParameter("date");%>
        <h3 style="color: brown">Date : <%=date%></h4>
        <br><br><br>
    <center>
        <%
            String id=String.valueOf(session.getAttribute("usr_id"));
            double subtotal=Double.parseDouble(request.getParameter("subtotal"));
            double discount=Double.parseDouble(request.getParameter("discount"));
        %>
        <table width="400px" cellspacing="0" border="1" bordercolor="black">    
                <tr bgcolor="tan">
                    <th>Product Name
                    <th>Price
                    <th>Quantity
                    <th>Total
                </tr>
             
             <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                
                String pnm;
                double price,quantity,total;

                try {

                    DBConnector dbc = new DBConnector();
                    con = dbc.getDbconnection();

                    pst=con.prepareStatement("select * from tempbill;");
                    
                    rs=pst.executeQuery();

                    while(rs.next()) {

                        pnm=rs.getString("prodname");
                        price=rs.getDouble("price");
                        quantity=rs.getDouble("quantity");
                        total=rs.getDouble("total");
                        
                     pst=con.prepareStatement("insert into sold_data values(?,?,?,?,?,?);");
                     pst.setString(1,id);
                     pst.setString(2,pnm);
                     pst.setDouble(3,price);
                     pst.setDouble(4,quantity);
                     pst.setDouble(5,total);
                     pst.setString(6,date);
                     
                     pst.executeUpdate();

                 
                        
            %>

            <tr>
                <td><%=pnm%>
                <td><%=price%>
                <td><%=quantity%>
                <td><%=total%>
                    
            </tr>

            <%
                    }

                    
                     pst=con.prepareStatement("insert into customers values(?,?,?,?,?);");
                     pst.setString(1,id);
                     pst.setDouble(2,subtotal);
                     pst.setDouble(3,discount);
                     pst.setDouble(4,(subtotal-discount));
                     pst.setString(5,date);

                     pst.executeUpdate();

                    con.close();
                }
            catch(Exception e) {
                out.println(e);
              }
            %>
            
            <tr> <td> <td> <td> <td>
            </tr>
            <tr> <td> <td> <td> <td>
            </tr>
            <tr> <td> <td> <td> <td>
            </tr>
            <tr>
                <td>
                <td>
                <td>Subtotal
                <td><%=subtotal%>
            </tr>
           
            <tr> <td> <td> <td> <td>
            </tr>
            <tr>
                <td>
                <td>
                <td>Discount
                <td><%=discount%>
            </tr>
            
            <tr> <td> <td> <td> <td>
            </tr>
            <tr> <td> <td> <td> <td>
            </tr>
            
             <tr>
                <td>
                <td>
                <td>NetBill
                <td><%=(subtotal-discount)%>
            </tr>
        </table>
            <br><br><br><br>
            <a href="MakeBill.jsp">Make Another Bill</a> | 
            <a href="User.jsp">Home</a>
        </center>
    </body>
</html>
