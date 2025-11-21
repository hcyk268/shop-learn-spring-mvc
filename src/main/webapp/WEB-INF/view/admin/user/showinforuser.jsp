<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Profile - ${userdetail.fullname}</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
                <style>
                    body {
                        background-color: #f0f2f5;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .profile-card {
                        border: none;
                        border-radius: 20px;
                        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                        overflow: hidden;
                        animation: fadeIn 0.8s cubic-bezier(0.2, 0.8, 0.2, 1);
                        background: white;
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                        width: 100%;
                    }

                    .profile-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
                    }

                    .card-header-custom {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 40px 20px;
                        text-align: center;
                        position: relative;
                    }

                    .avatar-circle {
                        width: 130px;
                        height: 130px;
                        background-color: white;
                        border-radius: 50%;
                        padding: 5px;
                        margin: 0 auto -65px;
                        /* Negative margin to overlap */
                        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                        position: relative;
                        z-index: 10;
                        transition: transform 0.3s ease;
                    }

                    .profile-card:hover .avatar-circle {
                        transform: scale(1.05);
                    }

                    .avatar-img {
                        width: 100%;
                        height: 100%;
                        border-radius: 50%;
                        object-fit: cover;
                        border: 4px solid white;
                    }

                    .card-body-custom {
                        padding-top: 80px;
                        /* Space for avatar */
                        padding-bottom: 40px;
                        padding-left: 40px;
                        padding-right: 40px;
                    }

                    .user-name {
                        font-weight: 700;
                        color: #2d3748;
                        margin-bottom: 5px;
                    }

                    .user-id {
                        color: #718096;
                        font-size: 0.9rem;
                        background: #edf2f7;
                        padding: 4px 12px;
                        border-radius: 15px;
                        display: inline-block;
                    }

                    .info-list {
                        margin-top: 30px;
                    }

                    .info-item {
                        padding: 18px;
                        border-bottom: 1px solid #f0f0f0;
                        transition: all 0.2s ease;
                        display: flex;
                        align-items: center;
                        border-radius: 10px;
                    }

                    .info-item:hover {
                        background-color: #f8f9fa;
                        transform: translateX(5px);
                    }

                    .info-item:last-child {
                        border-bottom: none;
                    }

                    .info-label {
                        font-weight: 600;
                        color: #718096;
                        width: 140px;
                        display: flex;
                        align-items: center;
                    }

                    .info-label i {
                        margin-right: 15px;
                        width: 20px;
                        text-align: center;
                        color: #764ba2;
                        font-size: 1.1rem;
                    }

                    .info-value {
                        color: #2d3748;
                        font-weight: 500;
                        flex: 1;
                        word-break: break-all;
                    }

                    .btn-back {
                        background: linear-gradient(135deg, #a0aec0 0%, #718096 100%);
                        border: none;
                        padding: 12px 30px;
                        border-radius: 30px;
                        transition: all 0.3s;
                        font-weight: 600;
                        letter-spacing: 0.5px;
                        margin-top: 20px;
                        display: inline-flex;
                        align-items: center;
                    }

                    .btn-back:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                        background: linear-gradient(135deg, #718096 0%, #4a5568 100%);
                    }

                    @keyframes fadeIn {
                        from {
                            opacity: 0;
                            transform: translateY(30px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    /* Responsive adjustments */
                    @media (max-width: 576px) {
                        .card-body-custom {
                            padding-left: 20px;
                            padding-right: 20px;
                        }

                        .info-item {
                            flex-direction: column;
                            align-items: flex-start;
                        }

                        .info-label {
                            margin-bottom: 5px;
                            width: 100%;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-8 col-lg-6">
                            <div class="card profile-card">
                                <div class="card-header-custom">
                                    <h3 class="mb-0 text-white" style="text-shadow: 0 2px 4px rgba(0,0,0,0.2);">User
                                        Profile</h3>
                                    <div class="avatar-circle">
                                        <!-- Using UI Avatars for dynamic initials based on name -->
                                        <img src="https://ui-avatars.com/api/?name=${userdetail.fullname}&background=random&size=128&bold=true"
                                            alt="User Avatar" class="avatar-img">
                                    </div>
                                </div>
                                <div class="card-body card-body-custom">
                                    <div class="text-center mb-4">
                                        <h2 class="user-name h3">${userdetail.fullname}</h2>
                                        <span class="user-id">ID: ${userdetail.id}</span>
                                    </div>
                                    <div class="info-list">
                                        <div class="info-item">
                                            <span class="info-label"><i class="fas fa-envelope"></i> Email</span>
                                            <span class="info-value">${userdetail.email}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label"><i class="fas fa-key"></i> Password</span>
                                            <span class="info-value">${userdetail.password}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label"><i class="fas fa-phone"></i> Phone</span>
                                            <span class="info-value">${userdetail.phone}</span>
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label"><i class="fas fa-map-marker-alt"></i>
                                                Address</span>
                                            <span class="info-value">${userdetail.address}</span>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <a href="javascript:history.back()"
                                            class="btn btn-secondary btn-back text-white text-decoration-none">
                                            <i class="fas fa-arrow-left me-2"></i> Back
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>

            </html>