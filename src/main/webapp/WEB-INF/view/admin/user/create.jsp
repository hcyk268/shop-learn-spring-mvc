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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const formFileavatar = $("#formFileavatar");
                        const avatarPreview = $("#avatarPreview");
                        formFileavatar.change(function (e) {
                            const file = e.target.files && e.target.files[0];
                            if (!file) {
                                avatarPreview.attr("src", "").hide();
                                return;
                            }
                            const imgURL = URL.createObjectURL(file);
                            avatarPreview.attr("src", imgURL).show();
                        });
                    });
                </script>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <style>
                    :root {
                        --ink: #0f172a;
                        --muted: #6b7280;
                        --border: #e5e7eb;
                        --surface: #ffffff;
                        --accent: #f5d76e;
                        --shadow: 0 20px 45px rgba(15, 23, 42, 0.08);
                    }

                    body {
                        font-family: 'Inter', 'Segoe UI', sans-serif;
                        background: radial-gradient(circle at 12% 15%, rgba(245, 215, 110, 0.08), transparent 28%), radial-gradient(circle at 80% 0%, rgba(15, 76, 117, 0.08), transparent 22%), #f7f8fb;
                        min-height: 100vh;
                        color: var(--ink);
                    }

                    .page-shell {
                        padding: 2.5rem 0 3rem;
                    }

                    .page-hero {
                        background: var(--surface);
                        border: 1px solid var(--border);
                        border-radius: 18px;
                        padding: 1.75rem 2rem;
                        box-shadow: var(--shadow);
                        position: relative;
                        overflow: hidden;
                    }

                    .page-hero::after {
                        content: "";
                        position: absolute;
                        inset: 0;
                        background: radial-gradient(circle at 80% 20%, rgba(245, 215, 110, 0.16), transparent 45%);
                        pointer-events: none;
                    }

                    .page-hero .eyebrow {
                        text-transform: uppercase;
                        letter-spacing: 0.08em;
                        font-size: 0.78rem;
                        color: var(--muted);
                        margin-bottom: 0.4rem;
                    }

                    .page-hero h1 {
                        color: var(--ink);
                        font-weight: 700;
                        margin-bottom: 0.35rem;
                    }

                    .page-hero .lead {
                        color: #4b5563;
                        max-width: 620px;
                        margin-bottom: 0.75rem;
                    }

                    .chip {
                        display: inline-flex;
                        align-items: center;
                        gap: 0.4rem;
                        padding: 0.45rem 0.85rem;
                        border-radius: 999px;
                        background: rgba(245, 215, 110, 0.18);
                        color: #7c5a00;
                        border: 1px solid rgba(245, 215, 110, 0.4);
                        font-size: 0.85rem;
                        letter-spacing: 0.01em;
                    }

                    .metric-pill {
                        background: #ffffff;
                        border: 1px solid var(--border);
                        padding: 0.85rem 1.1rem;
                        border-radius: 14px;
                        min-width: 180px;
                        box-shadow: var(--shadow);
                    }

                    .metric-pill .label {
                        color: var(--muted);
                        font-size: 0.78rem;
                        letter-spacing: 0.03em;
                        text-transform: uppercase;
                    }

                    .metric-pill .value {
                        display: block;
                        color: var(--ink);
                        font-weight: 600;
                        margin-top: 0.2rem;
                    }

                    .info-panel {
                        background: #ffffff;
                        border: 1px solid var(--border);
                        border-radius: 16px;
                        padding: 1.5rem 1.6rem;
                        box-shadow: var(--shadow);
                    }

                    .info-panel h5 {
                        color: var(--ink);
                        font-weight: 700;
                        margin-bottom: 0.35rem;
                    }

                    .info-panel p {
                        color: #4b5563;
                        font-size: 0.95rem;
                        margin-bottom: 1rem;
                    }

                    .info-panel ul {
                        list-style: none;
                        padding: 0;
                        margin: 0 0 1.25rem;
                    }

                    .info-panel li {
                        display: flex;
                        align-items: center;
                        gap: 0.65rem;
                        padding: 0.5rem 0;
                        color: #334155;
                        border-bottom: 1px dashed #e2e8f0;
                    }

                    .info-panel li:last-child {
                        border-bottom: none;
                    }

                    .info-panel i {
                        color: var(--accent);
                    }

                    .info-panel .support {
                        background: #f8fafc;
                        border: 1px dashed var(--border);
                        padding: 0.9rem 1rem;
                        border-radius: 12px;
                        color: #4b5563;
                        font-size: 0.9rem;
                    }

                    .form-surface {
                        background: #ffffff;
                        border: 1px solid var(--border);
                        border-radius: 18px;
                        padding: 1.4rem 1.75rem 1.75rem;
                        box-shadow: var(--shadow);
                        backdrop-filter: blur(4px);
                    }

                    .section-heading {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        gap: 1rem;
                        border-bottom: 1px solid #e5e7eb;
                        padding-bottom: 0.75rem;
                        margin-bottom: 1.1rem;
                    }

                    .section-heading .eyebrow {
                        margin: 0;
                        color: var(--muted);
                        letter-spacing: 0.08em;
                        font-size: 0.78rem;
                    }

                    .section-heading h5 {
                        margin: 0.2rem 0 0;
                        color: var(--ink);
                        font-weight: 700;
                    }

                    .badge-soft {
                        background: rgba(245, 215, 110, 0.18);
                        border: 1px solid rgba(245, 215, 110, 0.36);
                        color: #7c5a00;
                        padding: 0.35rem 0.75rem;
                        border-radius: 999px;
                        font-weight: 600;
                        font-size: 0.85rem;
                    }

                    .field {
                        display: flex;
                        flex-direction: column;
                        gap: 0.35rem;
                    }

                    .field label {
                        color: #0f172a;
                        font-weight: 600;
                        letter-spacing: 0.01em;
                    }

                    .field .form-control {
                        background: #ffffff;
                        border: 1px solid #e5e7eb;
                        border-radius: 12px;
                        padding: 0.85rem 1rem;
                        color: #0f172a;
                        transition: border-color 0.2s ease, box-shadow 0.2s ease, transform 0.15s ease;
                    }

                    .field .form-control:focus {
                        border-color: rgba(245, 215, 110, 0.9);
                        box-shadow: 0 10px 30px rgba(17, 24, 39, 0.08), 0 0 0 4px rgba(245, 215, 110, 0.18);
                        transform: translateY(-1px);
                    }

                    .field .form-control::placeholder {
                        color: #9ca3af;
                    }

                    .btn-accent {
                        background: linear-gradient(135deg, #f5d76e, #ffd85a);
                        color: #1f2937;
                        border: none;
                        border-radius: 12px;
                        padding: 0.9rem 1.4rem;
                        font-weight: 700;
                        letter-spacing: 0.02em;
                        box-shadow: 0 12px 30px rgba(245, 215, 110, 0.4);
                        transition: transform 0.15s ease, box-shadow 0.2s ease;
                    }

                    .btn-accent:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 18px 40px rgba(245, 215, 110, 0.48);
                    }

                    .btn-ghost {
                        color: #111827;
                        border: 1px solid #d1d5db;
                        border-radius: 12px;
                        padding: 0.9rem 1.4rem;
                        background: transparent;
                        transition: background 0.2s ease, border-color 0.2s ease, color 0.2s ease;
                    }

                    .btn-ghost:hover {
                        background: #f9fafb;
                        border-color: rgba(245, 215, 110, 0.6);
                        color: #0f172a;
                    }

                    @media (max-width: 991px) {
                        .metric-pill {
                            width: 100%;
                        }

                        .section-heading {
                            flex-direction: column;
                            align-items: flex-start;
                        }
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
                                <div class="page-shell">
                                    <div
                                        class="page-hero d-flex flex-wrap align-items-center justify-content-between gap-3">
                                        <div>
                                            <div class="eyebrow">Tài khoản</div>
                                            <h1>Thêm người dùng mới</h1>
                                            <p class="lead mb-2">Tạo nhanh tài khoản cho đội ngũ, thiết lập thông tin cơ
                                                bản và giữ giao diện liền mạch với admin mới.</p>
                                            <div class="d-flex flex-wrap gap-2">
                                                <span class="chip"><i class="fas fa-bolt"></i>Onboarding nhanh</span>
                                                <span class="chip"><i class="fas fa-shield-alt"></i>Bảo mật sẵn
                                                    sàng</span>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-wrap gap-3">
                                            <div class="metric-pill">
                                                <span class="label">Trạng thái</span>
                                                <span class="value">Đang tạo</span>
                                            </div>
                                            <div class="metric-pill">
                                                <span class="label">Chuẩn</span>
                                                <span class="value"><i class="fas fa-layer-group me-1"></i>Thông tin cơ
                                                    bản</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row g-4 align-items-stretch mt-2">
                                        <div class="col-lg-4">
                                            <div class="info-panel h-100">
                                                <h5>Checklist nhanh</h5>
                                                <p>Đảm bảo thông tin chính xác trước khi cấp quyền truy cập.</p>
                                                <ul>
                                                    <li><i class="fas fa-envelope"></i><span>Email cần hoạt động để kích
                                                            hoạt tài khoản</span></li>
                                                    <li><i class="fas fa-lock"></i><span>Mật khẩu tối thiểu 8 ký tự, nên
                                                            thêm ký tự đặc biệt</span></li>
                                                    <li><i class="fas fa-phone-alt"></i><span>Số điện thoại dùng cho hỗ
                                                            trợ & xác minh</span></li>
                                                </ul>
                                                <div class="support">
                                                    <i class="fas fa-life-ring me-1"></i>
                                                    Mẹo: nhấn Ctrl + Enter để tạo nhanh khi điền xong.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="form-surface h-100">
                                                <div class="section-heading">
                                                    <div>
                                                        <p class="eyebrow mb-1">Thông tin tài khoản</p>
                                                        <h5>Nhập thông tin người dùng</h5>
                                                    </div>
                                                    <span class="badge-soft">Bắt buộc</span>
                                                </div>
                                                <form:form method="post" action="/admin/user/create"
                                                    modelAttribute="newUser" enctype="multipart/form-data">
                                                    <div class="row g-3">
                                                        <div class="col-md-6">
                                                            <div class="field">
                                                                <label for="email">Email</label>
                                                                <form:input type="email" class="form-control" id="email"
                                                                    path="email" placeholder="name@example.com" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="field">
                                                                <label for="password">Mật khẩu</label>
                                                                <form:input type="password" class="form-control"
                                                                    id="password" path="password"
                                                                    placeholder="********" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="field">
                                                                <label for="fullname">Họ và tên</label>
                                                                <form:input type="text" class="form-control"
                                                                    id="fullname" path="fullname"
                                                                    placeholder="Nguyen Van A" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="field">
                                                                <label for="phone">Số điện thoại</label>
                                                                <form:input type="text" class="form-control" id="phone"
                                                                    path="phone" placeholder="(+84) 090..." />
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="field">
                                                                <label for="address">Địa chỉ</label>
                                                                <form:input type="text" class="form-control"
                                                                    id="address" path="address"
                                                                    placeholder="Số nhà, đường, quận/huyện" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="field">
                                                                <label for="role">Vai trò</label>
                                                                <form:select class="form-select"
                                                                    aria-label="Default select example" id="role"
                                                                    path="role.name">
                                                                    <form:option value="USER">User</form:option>
                                                                    <form:option value="ADMIN">Admin</form:option>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="field">
                                                                <label for="formFileavatar" class="form-label">Ảnh đại
                                                                    diện</label>
                                                                <input class="form-control form-control-sm" type="file"
                                                                    id="formFileavatar" accept=".png, .jpg, .jpeg"
                                                                    name="avatarFile" />
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <img id="avatarPreview" alt="Avatar preview"
                                                                class="img-thumbnail mt-2"
                                                                style="display: none; max-height: 140px;">
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="d-flex justify-content-between align-items-center gap-3 mt-4">
                                                        <button type="button" class="btn btn-ghost"
                                                            onclick="window.history.back()">Hủy</button>
                                                        <button type="submit" class="btn btn-accent">Tạo người
                                                            dùng</button>
                                                    </div>
                                                </form:form>
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