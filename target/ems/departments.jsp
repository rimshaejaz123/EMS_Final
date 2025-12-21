<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Departments - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-clock"></i> Dashboard</h3>
        
        <a href="dashboard-hr" class="menu-item"><i class="fa-solid fa-house"></i> Dashboard</a>
        <a href="employees" class="menu-item"><i class="fa-solid fa-users"></i> Employees</a>
        <a href="departments" class="menu-item active"><i class="fa-solid fa-sitemap"></i> Departments</a>
        <a href="salaries" class="menu-item"><i class="fa-solid fa-money-bill-wave"></i> Salaries</a>
        <a href="notices" class="menu-item"><i class="fa-solid fa-circle-exclamation"></i> Issue Notices</a>
        <a href="leaves" class="menu-item"><i class="fa-solid fa-calendar-xmark"></i> Leaves</a>
        
        <a href="attendances" class="menu-item"><i class="fa-solid fa-clipboard-user"></i> Attendances</a>
        
        <a href="recruitment" class="menu-item"><i class="fa-solid fa-user-plus"></i> Recruitment</a>
        <a href="profile" class="menu-item"><i class="fa-solid fa-id-badge"></i> HR Profiles</a>
        
        <form action="auth" method="POST" style="margin-top: auto;">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="menu-item" style="border:none; background:none; cursor:pointer; width:100%;">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </button>
        </form>
    </div>

    <div class="main-content">
        
        <div class="page-header">
            <h1 style="font-size: 28px;">Departments</h1>
            <a href="#" class="btn-add">Create Department</a>
        </div>

        <div class="filter-section">
            <label>Department :</label>
            <select class="filter-select">
                <option>All Departments</option>
                <option>Project K</option>
                <option>GoPro</option>
            </select>
        </div>

        <div class="dept-list">
            <c:forEach var="dept" items="${deptList}">
                <div class="dept-card">
                    <div class="dept-info">
                        <h2>${dept.name}</h2>
                        <p>${dept.description}</p>
                    </div>
                    <a href="#" class="btn-view">View</a>
                </div>
            </c:forEach>
            
            <c:if test="${empty deptList}">
                <p>No departments found.</p>
            </c:if>
        </div>

    </div>
</div>

</body>
</html>