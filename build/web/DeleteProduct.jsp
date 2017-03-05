<%-- 
    Document   : DeleteProduct
    Created on : Mar 27, 2016, 2:07:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="professionalbean.*"%>

<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>        
                    
        <%
                Connection con;
                PreparedStatement pst;
                
                int check = 0;
                String pnm = request.getParameter("pnm");
                String id=String.valueOf(session.getAttribute("usr_id"));
                try {

                    Class.forName("com.mysql.jdbc.Driver");

                    DBConnector dbc = new DBConnector();
                    con = dbc.getDbconnection();

                    pst=con.prepareStatement("delete from products where usr_id=? and prod_name=?;");
                    pst.setString(1,id);
                    pst.setString(2,pnm);

                    check = pst.executeUpdate();
                }
                catch(Exception e){
                    out.println(e);
                }
        %>
        
        <%
            if(check > 0) {
            %>

            <h2>Product <%=pnm%> Deleted Successfully.</h2>
            
            <% 
                }
            else { 
            %>
                <h2>Product <%=pnm%> Does Not Deleted.</h2>
            <% 
                }
            %>
    </body>
</html>
