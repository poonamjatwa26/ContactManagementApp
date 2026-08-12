<%-- 
    Document   : Nvabar
    Created on : 20 Jul, 2026, 5:06:47 PM
    Author     : poona
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact Management Navbar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
        <style>
            /* Navbar */
            .navbar{
                background:linear-gradient(90deg,#198754,#20c997);
                box-shadow:0 3px 10px rgba(0,0,0,.2);
            }

            .navbar-brand{
                color:#fff !important;
                font-size:28px;
                font-weight:bold;
            }

            .nav-link{
                color:#fff !important;
                font-size:17px;
                margin:0 8px;
                transition:.3s;
            }

            .nav-link:hover{
                background:#fff;
                color:#198754 !important;
                border-radius:5px;
                padding:8px 15px;
            }

            /* Navbar Buttons */
            .btn-login{
                background:#fff;
                color:#198754;
                font-weight:bold;
                border:none;
            }

            .btn-login:hover{
                background:#146c43;
                color:#fff;
            }

            .btn-register{
                background:#0d6efd;
                color:#fff;
                font-weight:bold;
                border:none;
            }

            .btn-register:hover{
                background:#0b5ed7;
            }

            /* Responsive */
            @media(max-width:991px){

                .navbar-nav{
                    margin-top:15px;
                    text-align:center;
                }

                .d-flex{
                    flex-direction:column;
                    margin-top:15px;
                }

                .btn-login,
                .btn-register{
                    width:100%;
                    margin-bottom:10px;
                }

                .nav-item{
                    list-style:none;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">

                <a class="navbar-brand" href="Home.jsp">
                    <i class="fa-solid fa-address-book"></i>
                    Contact Management
                </a>

                <button class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarNav"
                        aria-controls="navbarNav"
                        aria-expanded="false"
                        aria-label="Toggle navigation">

                    <span class="navbar-toggler-icon"></span>

                </button>

                <div class="collapse navbar-collapse" id="navbarNav">

                    <ul class="navbar-nav me-auto">

                    </ul>
                    <ul class="navbar-nav">
                        <div class="d-flex">
                            <%
                                String Username = (String) session.getAttribute("box");

                                if (Username == null) {

                            %>



                            <a href="Login.jsp" class="btn btn-login me-lg-2">
                                <i class="fa-solid fa-right-to-bracket"></i>
                                Login
                            </a>

                            <a href="Register.jsp" class="btn btn-register">
                                <i class="fa-solid fa-user-pen"></i>
                                Register
                            </a>
                            <%                      } else if ("Admin".equalsIgnoreCase(Username)) {

                            %>


                            <li class="nav-item">
                                <a class="nav-link" href="AddContact.jsp">
                                    <i class="fa-solid fa-user-plus"></i>
                                    Add Contact
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="ViewContact.jsp">
                                    <i class="fa-solid fa-address-book"></i>
                                    View Contact
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active"><i class="bi bi-person-circle"></i> <%=Username%></a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link active" href="Logout.jsp"><i class="bi bi-box-arrow-left"></i> logout</a>
                            </li> 
                            <%

                            } else {

                            %>


                            <li class="nav-item">
                                <a class="nav-link" href="AddContact.jsp">
                                    <i class="fa-solid fa-user-plus"></i>
                                    Add Contact
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="ViewContact.jsp">
                                    <i class="fa-solid fa-address-book"></i>
                                    View Contact
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active"><i class="bi bi-person-circle"> </i>  <%=Username%></a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link active" href="Logout.jsp"><i class="bi bi-box-arrow-left"></i> logout</a>
                            </li> 
                            <%

                                }
                            %>   
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>