<%-- 
    Document   : EndMonth
    Created on : Apr 2, 2016, 5:25:58 PM
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
            Connection con;
            PreparedStatement pst1,pst2,pst3;
            ResultSet rs1,rs2,rs3;
            
            String id=String.valueOf(session.getAttribute("usr_id"));
            String to=request.getParameter("to");
            String from=request.getParameter("from");
            
            Double profit,discount,total,totalexp;
            
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();
            
            pst1=con.prepareStatement("select sum(profit) from profit where usr_id=? and dte between ? and ?;");
            pst1.setString(1,id);
            pst1.setString(2,to);
            pst1.setString(3,from);
                    
            rs1=pst1.executeQuery();
            
            pst2=con.prepareStatement("select sum(discount),sum(grand_total) from customers where usr_id=? and dte between ? and ?;");
            pst2.setString(1,id);
            pst2.setString(2,to);
            pst2.setString(3,from);
            
            rs2=pst2.executeQuery();
            
            pst3=con.prepareStatement("select sum(exp_cost) from expenses where usr_id=? and dte between ? and ?;");
            pst3.setString(1,id);
            pst3.setString(2,to);
            pst3.setString(3,from);
            
            rs3=pst3.executeQuery();
            
            while(rs1.next()) {
                profit=rs1.getDouble(1);
                while(rs2.next()) {
                     discount=rs2.getDouble(1);
                    total=rs2.getDouble(2);
                   while(rs3.next()) {
                
                        totalexp=rs3.getDouble(1);
            
        %>
         <center>
             <br><br><br><br>
             <h1  style="color: brown">Business statistics</h1>
        <table width="300px" cellspacing="0" border="1" bordercolor="black" bgcolor="tan">    
           
                <tr>
                    <td>Total Business  </td>
                    <td><%=total%></td>
                </tr>
                <tr>
                    <td>Total Expenses  </td>
                    <td><%=totalexp%></td>
                </tr>
                <tr>
                    <td>Total Discount  </td>
                    <td><%=discount%></td>
                </tr>
                <tr>
                    <td>Total Profit </td>
                    <td><%=profit%></td>
                </tr>
                <tr>
                    <td>Net Profit </td>
                    <td><%=profit-totalexp%></td>
                </tr>
                <tr>
                    <td>Net Balance  </td>
                    <td><%=total-totalexp-discount%></td>
                </tr>
        
        </table>
                </center>
        <%
        }
    }
}
con.close();
        %>
    </body>
</html>
