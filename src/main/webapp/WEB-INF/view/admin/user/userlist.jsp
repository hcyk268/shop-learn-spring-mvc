<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>List Users</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <jsp:include page="../layout/sidebar.jsp" />
                    </div>
                    <div id="layoutSidenav_content">
                        <div class="container-fluid px-4">
                            <main>
                                <div style="margin: 30;">
                                    <div class="container mt-4">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <div style="font-size: 25; font-weight: bold;">
                                                        Table users
                                                    </div>
                                                    <a href="/admin/user/create" class="btn btn-primary">Create A
                                                        User</a>
                                                </div>

                                                <hr>

                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">EMAIL</th>
                                                            <th scope="col">FULL NAME</th>
                                                            <th scope="col">ACTION</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${allUsers}" var="user">
                                                            <tr>
                                                                <th scope="row">${user.id}</th>
                                                                <td>${user.email}</td>
                                                                <td>${user.fullname}</td>
                                                                <td>
                                                                    <a class="btn btn-success"
                                                                        href="/admin/user/${user.id}">
                                                                        View
                                                                    </a>
                                                                    <a class="btn btn-warning"
                                                                        href="/admin/user/update/${user.id}">
                                                                        Update
                                                                    </a>
                                                                    <a class="btn btn-danger"
                                                                        href="/admin/user/delete/${user.id}">
                                                                        Delete
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="<c:url value='/js/scripts.js'/>"></script>
                <script src="<c:url value='/js/chart-area-demo.js'/>"></script>
                <script src="<c:url value='/js/chart-bar-demo.js'/>"></script>
                <script src="<c:url value='/js/datatables-simple-demo.js'/>"></script>
            </body>

            </html>