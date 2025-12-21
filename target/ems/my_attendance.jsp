<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Attendance - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .attend-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            padding: 15px;
            border-bottom: 1px solid #eee;
            align-items: center;
        }
        .PRESENT { color: green; font-weight: bold; }
        .ABSENT { color: red; font-weight: bold; }
    </style>
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-user-tie"></i> Employee Panel</h3>
        <a href="dashboard-emp" class="menu-item"><i class="fa-solid fa-house"></i> My Dashboard</a>
        <a href="my-attendance" class="menu-item active"><i class="fa-solid fa-calendar-check"></i> My Attendance</a>
        <a href="my-salary" class="menu-item"><i class="fa-solid fa-file-invoice-dollar"></i> My Salary</a>
        <a href="apply-leave" class="menu-item"><i class="fa-solid fa-mug-hot"></i> Apply Leave</a>
        <a href="dashboard-emp" class="menu-item"><i class="fa-solid fa-bell"></i> Notices</a>
        <form action="auth" method="POST" style="margin-top: auto;">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="menu-item" style="border:none; background:none; cursor:pointer; width:100%;">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </button>
        </form>
    </div>

    <div class="main-content">
        <h2 style="margin-bottom: 20px;">Attendance History</h2>

        <div class="emp-container" style="max-width: 600px;">
            <div class="attend-grid" style="background: #1e3a8a; color: white; border-radius: 5px;">
                <div>Date</div>
                <div>Status</div>
            </div>

            <c:forEach var="a" items="${attendanceList}">
                <div class="attend-grid">
                    <div><i class="fa-regular fa-calendar"></i> ${a.date}</div>
                    <div class="${a.status}">${a.status}</div>
                </div>
            </c:forEach>

            <c:if test="${empty attendanceList}">
                <p style="padding:20px; text-align:center;">No attendance records found.</p>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>