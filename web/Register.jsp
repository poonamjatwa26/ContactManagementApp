<%-- 
    Document   : Register
    Created on : 20 Jul, 2026
    Author     : poona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact Management Register</title>
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
                    <p>Create Your Account</p>
                </div>

                <div class="card-body">
                    <%@include file="message.jsp"%>
                    <h4>Register</h4>
                    <form action="UserSave" method="post">
                        <div class="mb-3">
                            <label>Full Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                <input type="text" name="name" class="form-control" placeholder="Enter Full Name">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope-at-fill"></i></span>
                                <input type="email" name="email" class="form-control" placeholder="Enter Email Address">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-shield-lock-fill"></i></span>
                                <input type="password" name="password" class="form-control" placeholder="Enter Password">
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-person-plus-fill"></i> Register
                        </button>
                    </form>
                    <hr>

                    <p class="text-center mb-0">
                        Already have an account?
                        <a href="Login.jsp"><i class="bi bi-box-arrow-in-right"></i> Login Here</a>
                    </p>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"></script>
    </body>
</html>