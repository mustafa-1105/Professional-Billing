<%-- 
    Document   : CheckAvailable
    Created on : Mar 25, 2016, 2:08:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("usr_id");
%>

<jsp:useBean id="user" class="professionalbean.UserStatusFinder"/>

<jsp:setProperty name="user" property="usr_id" value="<%=id%>"/>

User ID <%=id%> 
<jsp:getProperty name="user" property="userstatus"/>