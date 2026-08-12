<%-- 
    Document   : EditUser
    Created on : 8 Aug, 2026, 11:59:02 AM
    Author     : poona
--%>

<%@page import="Model.User"%>
<%@page import="Factory.Test"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Management Edit User</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">    
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
            }

            body{
                font-family:Arial,sans-serif;
                background:linear-gradient(135deg,#E8F5E9,#C8E6C9,#A5D6A7);
            }

            /* Register Container */
            .register-container{
                min-height:calc(100vh - 70px);
                display:flex;
                justify-content:center;
                align-items:center;
                padding:30px;
            }

            /* Register Card */
            .card{
                width:100%;
                max-width:400px;
                border:none;
                border-radius:15px;
                overflow:hidden;
                box-shadow:0 8px 20px rgba(0,0,0,.2);
            }

            /* Header */
            .header{
                background:linear-gradient(135deg,#009688,#198754);
                color:#fff;
                text-align:center;
                padding:25px;
            }

            .header i{
                font-size:50px;
                margin-bottom:10px;
            }

            .header h2{
                margin:0;
                font-weight:bold;
            }

            .card-body{
                padding:25px;
            }

            /* Heading */
            h4{
                color:#198754;
                text-align:center;
                font-weight:bold;
                margin-bottom:20px;
            }

            /* Labels */
            label{
                font-weight:bold;
                color:#198754;
                margin-bottom:5px;
            }

            /* Input Group */
            .input-group-text{
                background:#E8F5E9;
                color:#198754;
            }

            .form-control:focus,
            .form-select:focus{
                border-color:#198754;
                box-shadow:none;
            }

            /* Button */
            .btn-success{
                width:100%;
                background:#198754;
                border:none;
                font-weight:bold;
                padding:10px;
            }

            .btn-success:hover{
                background:#157347;
            }

            /* Links */
            a{
                text-decoration:none !important;
                color:#009688;
                font-weight:bold;
            }

            a:hover{
                text-decoration:none !important;
                color:#157347;
            }

            /* Responsive */
            @media(max-width:768px){

                .register-container{
                    padding:20px;
                }

                .card{
                    max-width:100%;
                }

                .card-body{
                    padding:20px;
                }

                .header{
                    padding:20px;
                }

                .header i{
                    font-size:40px;
                }

                .header h2{
                    font-size:24px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
        <div class="register-container">
            <div class="card">
                <div class="header">
                    <i class="bi bi-person-plus-fill"></i>
                    <h2>Contact Management</h2>
                </div>

                <div class="card-body">
                    <%@include file="message.jsp"%>
                    <h4>Edit User Details</h4>
                    <%             
                        int id = Integer.parseInt(request.getParameter("id"));
                        User ob = Test.edit(id);
                    %>
                    <form action="UpdateUser.jsp" method="post">
                        <div class="mb-3">
                            <label>Id</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-badge-fill"></i></span>
                                <input type="number" name="id" class="form-control" value="<%=ob.getId()%>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Full Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                <input type="text" name="name" class="form-control" value="<%=ob.getName()%>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope-at-fill"></i></span>
                                <input type="email" name="email" class="form-control" value="<%=ob.getEmail()%>">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-shield-lock-fill"></i></span>
                                <input type="password" name="password" class="form-control" value="<%=ob.getPassword()%>">
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-person-check-fill"></i> Update User
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"></script>

    </body>
</html>
