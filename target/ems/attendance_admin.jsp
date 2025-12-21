<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Logs - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .filter-bar {
            background: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            align-items: center;
            gap: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }
        .PRESENT { background: #d4edda; color: #155724; }
        .ABSENT { background: #f8d7da; color: #721c24; }
        .NOT.MARKED { background: #e2e3e5; color: #383d41; } /* Grey for no record */
    </style>
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
        <a href="attendances" class="menu-item active"><i class="fa-solid fa-clipboard-user"></i> Attendances</a>
        <a href="recruitment" class="menu-item"><i class="fa-solid fa-user-plus"></i> Recruitment</a>
        
        <form action="auth" method="POST" style="margin-top: auto;">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="menu-item" style="border:none; background:none; cursor:pointer; width:100%;">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </button>
        </form>
    </div>

    <div class="main-content">
        <h2 style="margin-bottom: 20px;">Employee Attendance Log</h2>

        <form action="attendances" method="GET" class="filter-bar">
            <label style="font-weight:600;">Select Date:</label>
            <input type="date" name="date" value="${selectedDate}" class="form-control" style="width:auto;" onchange="this.form.submit()">
            <button type="submit" class="btn" style="width:auto; margin:0; padding: 8px 15px;">Filter</button>
        </form>

        <div class="emp-container">
            <div class="emp-header-row" style="grid-template-columns: 2fr 2fr 1fr;">
                <div class="header-cell">Employee Name</div>
                <div class="header-cell">Department</div>
                <div class="header-cell">Status</div>
            </div>

            <c:forEach var="a" items="${dailyList}">
                <div class="emp-row" style="grid-template-columns: 2fr 2fr 1fr;">
                    <div class="emp-cell text-left"><strong>${a.name}</strong></div>
                    <div class="emp-cell">${a.dept}</div>
                    <div class="emp-cell">
                        <span class="status-badge ${a.status}">${a.status}</span>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty dailyList}">
                <p style="padding:20px; text-align:center;">No employees found.</p>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>