<%-- 
    Document   : Update
    Created on : Mar 27, 2016, 4:47:04 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="professionalbean.*"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
                String id=String.valueOf(session.getAttribute("usr_id"));
                String pnm = request.getParameter("pnm");
                double purchase=Double.parseDouble(request.getParameter("purchase"));
                double selling=Double.parseDouble(request.getParameter("selling"));
                double stock=Double.parseDouble(request.getParameter("stock"));
                String unit = request.getParameter("unit");
                
            %>
            
            <jsp:useBean id="update" class="professionalbean.Update_Product"/>

            <jsp:setProperty name="update" property="id" value="<%=id%>"/>
            <jsp:setProperty name="update" property="pnm" value="<%=pnm%>"/>
            <jsp:setProperty name="update" property="purchase" value="<%=purchase%>"/>
            <jsp:setProperty name="update" property="selling" value="<%=selling%>"/>
            <jsp:setProperty name="update" property="stock" value="<%=stock%>"/>
            <jsp:setProperty name="update" property="unit" value="<%=unit%>"/>

            <h3><%=pnm%> Updated Successfully.</h3>
    </body>
</html>
