<%@page import="java.util.List"%>
<%@page import="Model.Contact"%>
<%@page import="Factory.Test1"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Contact Management View Contact</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <style>
            body{
                background:linear-gradient(135deg,#E8F5E9,#C8E6C9);
            }
            .title{
                color:#198754;
                font-weight:bold;
            }
            .card-box{
                background:white;
                padding:20px;
                border-radius:15px;
                box-shadow:0 5px 15px #999;
            }
        </style>
    </head>

    <body>

        <%@include file="Navbar.jsp"%>

        <div class="container mt-4">

            <h2 class="text-center title">
                <i class="fa-solid fa-address-book"></i>
                View Contact
            </h2>

            <div class="card-box mt-4">

                <form method="post" action="ViewContact.jsp">

                    <div class="row">

                        <div class="col-md-4">
                            <input type="text" name="firstName"
                                   class="form-control"
                                   placeholder="Search First Name">
                        </div>

                        <div class="col-md-2">
                            <button class="btn btn-warning w-100">
                                <i class="fa fa-search"></i> Search
                            </button>
                        </div>

                    </div>

                </form>

            </div>

            <%
                String name = request.getParameter("firstName");

                List<Contact> list = Test1.read();

                if (name == null || name.trim().isEmpty()) {

                    if (list == null || list.isEmpty()) {
            %>

            <div class="alert alert-danger text-center mt-4">
                No Contact Found
            </div>

            <%
                } else {
            %>

            <div class="container mt-3 p-4 bg-light">

                <h5>Total Contacts : <%=list.size()%></h5>

                <table class="table table-bordered table-hover text-center">

                    <tr class="table-success">
                        <th>Photo</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Phone Type</th>
                        <th>Email</th>
                        <th>Company</th>
                        <th>Date</th>
                        <th>DateType</th>
                        <th>Group</th>
                        <th>Action</th>
                    </tr>

                    <%
                        for (Contact ob : list) {
                    %>

                    <tr>

                        <td>
                            <img src="images/<%=ob.getPhoto()%>"
                                 width="50"
                                 height="50"
                                 class="rounded-circle">
                        </td>

                        <td>
                            <%=ob.getFirstName()%>
                            <%=ob.getLastName()%>
                        </td>

                        <td><%=ob.getPhone()%></td>
                        <td><%=ob.getPhoneType()%></td>
                        <td><%=ob.getEmail()%></td>
                        <td><%=ob.getCompany()%></td>
                        <td><%=ob.getDate()%></td>
                        <td><%=ob.getDateType()%></td>
                        <td><%=ob.getGrouping()%></td>

                        <td>

                            <a href="EditContact.jsp?id=<%=ob.getId()%>"
                               class="btn btn-success btn-sm">
                                <i class="fa fa-edit"></i>
                            </a>

                            <a href="delete?id=<%=ob.getId()%>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Delete this contact?')">
                                <i class="fa fa-trash"></i>
                            </a>

                        </td>

                    </tr>

                    <%
                        }
                    %>

                </table>

            </div>

            <%
                    }

                } else {

                    Contact ob = Test1.search(name);

                    if (ob == null || ob.getFirstName() == null) {
            %>

            <div class="alert alert-danger text-center mt-4">
                Contact Not Found
            </div>

            <%
                    } else {
            %>

            <div class="container mt-3 p-4 bg-light">

                <h5>Total Contacts : 1</h5>

                <table class="table table-bordered table-hover text-center">

                    <tr class="table-success">
                        <th>Photo</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Phone Type</th>
                        <th>Email</th>
                        <th>Company</th>
                        <th>Date</th>
                        <th>DateType</th>
                        <th>Group</th>
                        <th>Action</th>
                    </tr>

                    <tr>

                        <td>
                            <img src="images/<%=ob.getPhoto()%>"
                                 width="50"
                                 height="50"
                                 class="rounded-circle">
                        </td>

                        <td>
                            <%=ob.getFirstName()%>
                            <%=ob.getLastName()%>
                        </td>

                        <td><%=ob.getPhone()%></td>
                        <td><%=ob.getPhoneType()%></td>
                        <td><%=ob.getEmail()%></td>
                        <td><%=ob.getCompany()%></td>
                        <td><%=ob.getDate()%></td>
                        <td><%=ob.getDateType()%></td>
                        <td><%=ob.getGrouping()%></td>

                        <td>

                            <a href="EditContact.jsp?id=<%=ob.getId()%>"
                               class="btn btn-success btn-sm">
                                <i class="fa fa-edit"></i>
                            </a>

                            <a href="delete?id=<%=ob.getId()%>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Delete this contact?')">
                                <i class="fa fa-trash"></i>
                            </a>

                        </td>

                    </tr>

                </table>

            </div>

            <%
                    }
                }
            %>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>