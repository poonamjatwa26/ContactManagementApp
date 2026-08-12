<%-- 
    Document   : RegisterRead
    Created on : 26 Jul, 2026, 2:37:32 PM
    Author     : poona
--%>
<%
    HttpSession se = request.getSession(false);

    if (se == null || se.getAttribute("box") == null) {
%>
<%@page import="Model.User"%>
<%@page import="Factory.Test"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Register Read</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />  
        <style>

            body{
                font-family:Arial,sans-serif;
                background:linear-gradient(135deg,#E8F5E9,#C8E6C9,#A5D6A7);
                min-height:100vh;
            }


            /* Main Card */
            .card{
                border:none;
                border-radius:15px;
                overflow:hidden;
                box-shadow:0 8px 20px rgba(0,0,0,.2);
            }


            /* Header Same as Login */
            .card-header{
                background:linear-gradient(135deg,#009688,#198754) !important;
                color:white !important;
                text-align:center;
                padding:25px;
            }


            .card-header h4{
                color:white !important;
                font-weight:bold;
                font-size:25px;
            }


            /* Body */
            .card-body{
                padding:25px;
                background:#ffffff;
            }


            /* Table Header */
            .table-success{
                background:#E8F5E9 !important;
                color:#198754 !important;
            }


            /* Table */
            .table{
                border-radius:10px;
                overflow:hidden;
            }


            .table th{
                font-weight:bold;
            }


            /* Buttons */
            .btn-success{
                background:#198754;
                border:none;
            }


            .btn-success:hover{
                background:#157347;
            }


            .btn-danger{
                border:none;
            }

        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="card shadow p-5 text-center">
                <h2 class="text-danger">Please Login First</h2>
                <p class="mt-3">
                    You must login to access the Home Page.
                </p>
                <a href="Login.jsp" class="btn btn-primary">
                    Login
                </a>
            </div>
        </div>
        <%
                return;
            }
        %>
        <%@include file="Navbar.jsp"%>
        <div class="container mt-4">
            <div class="card shadow">
                <div class="card-header bg-success text-white">
                    <h4>User Information</h4>
                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover text-center">
                        <tr class="table-success">
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Action</th>
                        </tr>
                        <%                    List<User> li = Test.read();
                            for (User ob : li) {
                        %>

                        <tr>
                            <td><%=ob.getId()%></td>
                            <td><%=ob.getName()%></td>
                            <td><%=ob.getEmail()%></td>
                            <td><%=ob.getPassword()%></td>
                            <td>
                                <a href="EditUser.jsp?id=<%=ob.getId()%>" class="btn btn-success btn-sm">
                                    <i class="fa-solid fa-pen"></i> Edit
                                </a>

                                <a href="DeleteUser.jsp?id=<%=ob.getId()%>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Delete this note?')">
                                    <i class="fa-solid fa-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
