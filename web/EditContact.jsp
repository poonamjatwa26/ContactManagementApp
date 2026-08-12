<%-- 
    Document   : EditContact
    Created on : 8 Aug, 2026, 11:58:51 AM
    Author     : poona
--%>

<%@page import="Model.Contact"%>
<%@page import="Factory.Test1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Management Edit Contact</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css">
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
            }

            body{
                font-family:Arial, sans-serif;
                background:linear-gradient(135deg,#E8F5E9,#C8E6C9,#A5D6A7);
            }

            /* Add Contact Card */
            .card{
                width:100%;
                max-width:900px;
                margin:auto;
                border:none;
                border-radius:15px;
                overflow:hidden;
                box-shadow:0 8px 20px rgba(0,0,0,0.2);
            }

            .card-header{
                background:linear-gradient(135deg,#009688,#198754);
                color:#fff !important;
                padding:18px;
                text-align:center;
            }

            .card-header h3{
                margin:0;
                font-size:2rem;
            }

            /* Card Body */
            .card-body{
                padding:30px;
            }

            /* Labels */
            .form-label{
                font-weight:bold;
                color:#198754;
            }

            /* Inputs */
            .form-control,
            .form-select{
                border-radius:8px;
            }

            .form-control:focus,
            .form-select:focus{
                border-color:#198754;
                box-shadow:none;
            }

            /* Buttons */
            .btn-success{
                background:#198754;
                border:none;
                font-weight:bold;
            }

            .btn-success:hover{
                background:#157347;
            }

            .btn-warning{
                font-weight:bold;
            }

            /* Icons */
            .form-label i{
                color:#198754;
                margin-right:5px;
            }

            /* Responsive */
            @media(max-width:768px){

                .card{
                    max-width:100%;
                }

                .card-body{
                    padding:20px;
                }

                .text-end{
                    text-align:center !important;
                }

                .text-end .btn{
                    width:100%;
                    margin-top:10px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="Navbar.jsp"%>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header text-center">
                            <h3 class="mb-0">
                                <%@include file="message.jsp"%>
                                <i class="bi bi-person-plus-fill"></i> Edit Contact
                            </h3>
                        </div>

                        <div class="card-body">
                            <%                                
                                int id = Integer.parseInt(request.getParameter("id"));
                                Contact ob = Test1.edit(id);
                            %>
                            <form action="UpdateContact" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<%=ob.getId()%>">

                                <input type="hidden" name="oldphoto" value="<%=ob.getPhoto()%>">

                                <div class="row g-3">
                                    <div  class="col-md-6">
                                        <label class="form-label"><i class="bi bi-image-fill"></i>Current Profile Image: </label><br>
                                        <img src="images/<%=ob.getPhoto()%>" width="120"><br>
                                    </div>

                                    <div  class="col-md-6">
                                        <label class="form-label"><i class="bi bi-image-fill"></i>Change Profile Image: </label>
                                        <input class="form-control" class="form-control" type="file" name="photo">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-person-fill"></i> First Name</label>
                                        <input type="text" name="firstName" class="form-control" value="<%=ob.getFirstName()%>">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-person-fill"></i> Last Name</label>
                                        <input type="text" name="lastName" class="form-control" value="<%=ob.getLastName()%>">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-telephone-fill"></i> Phone Number</label>
                                        <input type="tel" name="phone" class="form-control" value="<%=ob.getPhone()%>">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-phone-fill"></i> Phone Type</label>
                                        <select name="phoneType" class="form-select" value="<%=ob.getPhoneType()%>">
                                            <option value="Mobile">Mobile</option>
                                            <option value="Home">Home</option>
                                            <option value="Office">Office</option>
                                            <option value="Work">Work</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-envelope-fill"></i> Email</label>
                                        <input type="email" name="email" class="form-control" value="<%=ob.getEmail()%>">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-building-fill"></i> Company</label>
                                        <input type="text" name="company" class="form-control" value="<%=ob.getCompany()%>">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-calendar-date-fill"></i> Date</label>
                                        <input type="date" name="date" class="form-control" value="<%=ob.getDate()%>">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-calendar-heart-fill"></i> Date Type</label>
                                        <select name="dateType" class="form-select" value="<%=ob.getDateType()%>">
                                            <option>Birthday</option>
                                            <option>Anniversary</option>
                                            <option>Custom</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label"><i class="bi bi-people-fill"></i> Group</label>
                                        <select name="grouping" class="form-select" value="<%=ob.getGrouping()%>">
                                            <option>Family</option>
                                            <option>Friends</option>
                                            <option>College</option>
                                            <option>Work</option>
                                            <option>Business</option>
                                            <option>Others</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="text-end mt-4">
                                    <button type="reset" class="btn btn-warning"><i class="bi bi-arrow-clockwise"></i> Reset</button>
                                    <button type="submit" class="btn btn-success">
                                        <i class="bi bi-person-check-fill"></i> Update Contact
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"></script>
    </body>
</html>
