<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>HR Profile - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-clock"></i> Dashboard</h3>
        <a href="dashboard-hr" class="menu-item"><i class="fa-solid fa-house"></i> Dashboard</a>
        <a href="employees" class="menu-item"><i class="fa-solid fa-users"></i> Employees</a>
        <a href="departments" class="menu-item"><i class="fa-solid fa-sitemap"></i> Departments</a>
        <a href="salaries" class="menu-item"><i class="fa-solid fa-money-bill-wave"></i> Salaries</a>
        <a href="notices" class="menu-item"><i class="fa-solid fa-circle-exclamation"></i> Issue Notices</a>
        <a href="leaves" class="menu-item"><i class="fa-solid fa-calendar-xmark"></i> Leaves</a>
        <a href="attendances" class="menu-item"><i class="fa-solid fa-clipboard-user"></i> Attendances</a>
        <a href="recruitment" class="menu-item"><i class="fa-solid fa-user-plus"></i> Recruitment</a>
        <a href="profile" class="menu-item active"><i class="fa-solid fa-id-badge"></i> HR Profiles</a>
        
        <form action="auth" method="POST" style="margin-top: auto;">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="menu-item" style="border:none; background:none; cursor:pointer; width:100%;">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </button>
        </form>
    </div>

    <div class="main-content">
        <h2 style="margin-bottom: 20px;">Profile Settings</h2>

        <c:if test="${not empty msg}">
            <div style="background:#d4edda; color:#155724; padding:15px; border-radius:5px; margin-bottom:20px;">
                ${msg}
            </div>
        </c:if>

        <div class="notice-grid">
            
            <div class="form-card">
                <h3 style="margin-bottom:20px; color:#1976d2;">Edit Personal Details</h3>
                <form action="profile" method="POST">
                    <input type="hidden" name="action" value="updateInfo">
                    
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="fullname" value="${sessionScope.user.fullName}" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" value="${sessionScope.user.email}" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label>Role</label>
                        <input type="text" value="HR Administrator" class="form-control" disabled style="background:#eee;">
                    </div>

                    <button type="submit" class="btn-submit">Update Profile</button>
                </form>
            </div>

            <div class="form-card" style="border-top: 4px solid #dc3545;">
                <h3 style="margin-bottom:20px; color:#dc3545;">Security</h3>
                <form action="profile" method="POST">
                    <input type="hidden" name="action" value="changePass">
                    
                    <div class="form-group">
                        <label>New Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Enter new password" required>
                    </div>

                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input type="password" class="form-control" placeholder="Re-enter password">
                    </div>

                    <button type="submit" class="btn-submit" style="background:#dc3545;">Change Password</button>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>