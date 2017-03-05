<%-- 
    Document   : ProcessBill
    Created on : Apr 3, 2016, 1:45:24 PM
    Author     : admin
--%>

<%@page import="java.sql.*"%>
<%@page import="professionalbean.DBConnector"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="billingStyles.css">
    </head>
    <body>
        <br><br><br><br><br>
        <%
           try
            {
            DBConnector dbc=new DBConnector();
            
            Connection con=dbc.getDbconnection();
            PreparedStatement pst=con.prepareStatement("delete from tempbill;");
            
            pst.executeUpdate();
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
        Vector vct=new Vector();
        Enumeration<String> paramNames = request.getParameterNames();
        while(paramNames.hasMoreElements()) {
         String paramName = paramNames.nextElement();
         String[] paramValues = request.getParameterValues(paramName);
         
         if(paramValues[0].equals("none"))
             paramValues[0]="";
         
              vct.add(paramValues[0]);              
        }
        
        for(int i=0;i<vct.size();i+=3) {
            String prodname=String.valueOf(vct.elementAt(i));
            double prc=Double.parseDouble(String.valueOf(vct.elementAt(i+1)));
            double quantity=Double.parseDouble(String.valueOf(vct.elementAt(i+2)));
            
            try
            {
            DBConnector dbc=new DBConnector();
            
            Connection con=dbc.getDbconnection();
            PreparedStatement pst=con.prepareStatement("insert into tempbill values(?,?,?,?)");
            
            pst.setString(1,prodname);
            pst.setDouble(2,prc);
            pst.setDouble(3,quantity);
            pst.setDouble(4,prc*quantity);
            
            pst.executeUpdate();
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
        }
        %>
        <center>
         <table width="400px" cellspacing="0" border="1" bordercolor="black">    
                <tr bgcolor="tan">
                    <th>Product Name
                    <th>Price
                    <th>Quantity
                    <th>Total
                </tr>
            </center>
             
             <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                
                String pnm;
                double subtotal=0;
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
                        subtotal = subtotal+total;
            %>

            <tr>
                <td><%=pnm%>
                <td><%=price%>
                <td><%=quantity%>
                <td><%=total%>
            </tr>

            <%
                    }

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
            <form name="frm" method="post" action="FinalBill.jsp?subtotal=<%=subtotal%>">
   
            <tr>
                <td>
                <td>
                <td>Discount
                <td><input type="text" name="discount">
            </tr>
            
            <tr>
                <td>
                <td>
                <td>
                <td><center><input type="submit" value="NetBill" style="background-color: burlywood"></center>
            </tr>
            
            <h3>Date : <input type="date" name="date"></h3>
            </form>
    </table>
    <br>
        
    </body>
</html>
