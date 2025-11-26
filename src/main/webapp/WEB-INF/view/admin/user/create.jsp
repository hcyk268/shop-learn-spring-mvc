<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Create User</title>
                <!-- Theme + Bootstrap -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <style>
                    :root {
                        --primary-gradient: linear-gradient(135deg, #243949 0%, #517fa4 100%);
                        --glass-bg: rgba(255, 255, 255, 0.95);
                    }

                    body {
                        font-family: 'Inter', 'Segoe UI', sans-serif;
                        background: #f5f7fb;
                        min-height: 100vh;
                    }

                    .main-card {
                        background: var(--glass-bg);
                        border: none;
                        border-radius: 20px;
                        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
                        overflow: hidden;
                        backdrop-filter: blur(10px);
                        animation: fadeIn 0.6s ease-out;
                    }

                    @keyframes fadeIn {
                        from {
                            opacity: 0;
                            transform: translateY(20px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    .card-header-custom {
                        background: transparent;
                        padding: 2.5rem 2rem 1rem;
                        text-align: center;
                        border: none;
                    }

                    .icon-wrapper {
                        width: 80px;
                        height: 80px;
                        background: rgba(118, 75, 162, 0.1);
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1.5rem;
                    }

                    .icon-wrapper i {
                        font-size: 2.5rem;
                        color: #764ba2;
                    }

                    .card-header-custom h2 {
                        font-weight: 700;
                        color: #2d3748;
                        margin-bottom: 0.5rem;
                    }

                    .card-header-custom p {
                        color: #718096;
                        font-size: 0.95rem;
                    }

                    .card-body-custom {
                        padding: 1rem 2.5rem 3rem;
                    }

                    .form-floating>.form-control {
                        border-radius: 10px;
                        border: 2px solid #e2e8f0;
                        padding-left: 1rem;
                    }

                    .form-floating>.form-control:focus {
                        border-color: #764ba2;
                        box-shadow: 0 0 0 4px rgba(118, 75, 162, 0.1);
                    }

                    .form-floating>label {
                        padding-left: 1rem;
                        color: #718096;
                    }

                    .btn-submit {
                        background: var(--primary-gradient);
                        border: none;
                        border-radius: 10px;
                        padding: 12px;
                        font-weight: 600;
                        letter-spacing: 0.5px;
                        transition: all 0.3s ease;
                    }

                    .btn-submit:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 20px rgba(118, 75, 162, 0.3);
                    }
                </style>
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
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-md-8 col-lg-6 col-xl-5">
                                            <div class="card main-card">
                                                <div class="card-header-custom">
                                                    <div class="icon-wrapper">
                                                        <i class="fas fa-user-plus"></i>
                                                    </div>
                                                    <h2>Create Account</h2>
                                                    <p>Please fill in the details to register a new user</p>
                                                </div>

                                                <div class="card-body-custom">
                                                    <form:form method="post" action="/admin/user/create"
                                                        modelAttribute="newUser">

                                                        <div class="form-floating mb-3">
                                                            <form:input type="email" class="form-control" id="email"
                                                                path="email" placeholder="name@example.com" />
                                                            <label for="email">Email Address</label>
                                                        </div>

                                                        <div class="form-floating mb-3">
                                                            <form:input type="password" class="form-control"
                                                                id="password" path="password" placeholder="Password" />
                                                            <label for="password">Password</label>
                                                        </div>

                                                        <div class="form-floating mb-3">
                                                            <form:input type="text" class="form-control" id="phone"
                                                                path="phone" placeholder="Phone Number" />
                                                            <label for="phone">Phone Number</label>
                                                        </div>

                                                        <div class="form-floating mb-3">
                                                            <form:input type="text" class="form-control" id="fullname"
                                                                path="fullname" placeholder="Full Name" />
                                                            <label for="fullname">Full Name</label>
                                                        </div>

                                                        <div class="form-floating mb-4">
                                                            <form:input type="text" class="form-control" id="address"
                                                                path="address" placeholder="Address" />
                                                            <label for="address">Address</label>
                                                        </div>

                                                        <div class="d-grid">
                                                            <button type="submit"
                                                                class="btn btn-primary btn-submit btn-lg">
                                                                Create User
                                                            </button>
                                                        </div>
                                                    </form:form>
                                                </div>
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