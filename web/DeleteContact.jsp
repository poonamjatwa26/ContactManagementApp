<%-- 
    Document   : UpdateUser
    Created on : 8 Aug, 2026, 12:27:02 PM
    Author     : poona
--%>

<%@page import="Factory.Test1"%>
<%@page import="Factory.Test"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Management Delete Contact</title>
        <style>

            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
            }

            body{
                background:linear-gradient(135deg,#E8F5E9,#C8E6C9);
                font-family:Arial,sans-serif;
                text-align:center;
                padding-top:120px;
            }

            .card{
                background:white;
                width:400px;
                margin:auto;
                padding:30px;
                border-radius:15px;
                box-shadow:0 5px 15px #999;
            }

            h2{
                color:#198754;
                margin-bottom:15px;
            }

            p{
                color:#666;
                margin-bottom:25px;
            }

            a{
                background:#198754;
                color:white;
                padding:10px 20px;
                text-decoration:none;
                border-radius:6px;
                display:inline-block;
            }

            a:hover{
                background:#157347;
            }

            .success{
                color:#198754;
                font-size:50px;
            }

            .error{
                color:#dc3545;
                font-size:50px;
            }

        </style>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            int i = Test1.delete(id);

            if (i == 0) {
        %>

        <div class="card">
            <h2>Contact Deleted Successfully!</h2>
            <p>Contact details have been deleted successfully.</p>

            <a href="ViewContact.jsp">
                View Contact
            </a>
        </div>

        <%
        } else {
        %>

        <div class="card">
            <h2 style="color:#dc3545;">
                Contact Not Deleted!
            </h2>

            <p>
                Sorry, Contact details could not be deleted.
            </p>

            <a href="ViewContact.jsp">
                Back to Contact
            </a>
        </div>

        <%
            }
        %>
    </body>
</html>
