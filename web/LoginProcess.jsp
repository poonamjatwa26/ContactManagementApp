<%-- 
    Document   : LoginProcess
    Created on : 24 Jul, 2026, 4:32:57 PM
    Author     : poona
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/contactapp", "root", "");
            PreparedStatement psmt = con.prepareStatement("select * from user where email=? and password=?");
            psmt.setString(1, email);
            psmt.setString(2, password);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                HttpSession s = request.getSession();
                String name = rs.getString("name");
                s.setAttribute("box", name);
                
                if (email.equals("abc@gmail.com") && password.equals("abc@123")) {

                    response.sendRedirect("RegisterRead.jsp");
                    return;
                } else {

                    response.sendRedirect("ViewContact.jsp");
                    return;
                }

            } else {
                session.setAttribute("message", "Wrong Email and Password");
                response.sendRedirect("Login.jsp");
            }


        %>
    </body>
</html>
