<%-- 
    Document   : Login
    Created on : 20 Jul, 2026
    Author     : poona
--%>       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Contact Management Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
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

            /* Login Container */
            .login-container{
                min-height:calc(100vh - 70px);
                display:flex;
                justify-content:center;
                align-items:center;
                padding:30px;
            }

            /* Login Card */
            .card{
                width:100%;
                max-width:400px;
                border:none;
                border-radius:15px;
                overflow:hidden;
                box-shadow:0 8px 20px rgba(0,0,0,.2);
            }

            /* Login Header */
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
                margin-bottom:5px;
                font-weight:bold;
            }

            .card-body{
                padding:25px;
            }

            h4{
                color:#198754;
                text-align:center;
                font-weight:bold;
                margin-bottom:20px;
            }

            label{
                font-weight:bold;
                color:#198754;
            }

            .input-group-text{
                background:#E8F5E9;
                color:#198754;
            }

            .form-control:focus{
                border-color:#198754;
                box-shadow:none;
            }

            /* Login Button */
            .btn-success{
                width:100%;
                background:#198754;
                border:none;
                font-weight:bold;
            }

            .btn-success:hover{
                background:#157347;
            }

            a{
                text-decoration:none !important;
                color:#009688;
                font-weight:bold;
            }

            a:hover{
                text-decoration:none !important;
                color:#157347;
            }
        </style>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
        <div class="login-container">

            <div class="card">
                <div class="header">
                    <i class="bi bi-person-lines-fill"></i>
                    <h2>Contact Management</h2>
                    <p>Manage Your Contacts Easily</p>
                </div>
                <div class="card-body">
                    <%@include file="message.jsp"%>
                    <h4>Welcome Back</h4>
                    <form action="LoginProcess.jsp" method="post">
                        <div class="mb-3">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-envelope-at-fill"></i>
                                </span>

                                <input type="email" name="email" class="form-control" placeholder="Enter Email">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-shield-lock-fill"></i>
                                </span>

                                <input type="password" name="password" class="form-control" placeholder="Enter Password">
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-box-arrow-in-right"></i>
                            Login
                        </button>
                    </form>

                    <hr>

                    <p class="text-center mb-0">
                        Don't have an account?
                        <a href="Register.jsp">
                            <i class="bi bi-person-plus-fill"></i>
                            Register Here
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"></script>
    </body>
</html>