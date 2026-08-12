<%-- 
    Document   : Logout
    Created on : 24 Jul, 2026, 4:41:00 PM
    Author     : poona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Management Logout</title>
    </head>
    <body>
        <%@include file="Navbar.jsp"%>
        <%
            session.invalidate();
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>
