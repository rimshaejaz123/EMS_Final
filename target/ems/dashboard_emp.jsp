<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-user-tie"></i> Employee Panel</h3>
        
        <a href="dashboard-emp" class="menu-item active"><i class="fa-solid fa-house"></i> My Dashboard</a>
        <a href="my-attendance" class="menu-item"><i class="fa-solid fa-calendar-check"></i> My Attendance</a>
        <a href="my-salary" class="menu-item"><i class="fa-solid fa-file-invoice-dollar"></i> My Salary</a>
        <a href="apply-leave" class="menu-item"><i class="fa-solid fa-mug-hot"></i> Apply Leave</a>
        <a href="#" class="menu-item"><i class="fa-solid fa-bell"></i> Notices</a>
        
        <form action="auth" method="POST" style="margin-top: auto;">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="menu-item" style="border:none; background:none; cursor:pointer; width:100%;">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </button>
        </form>
    </div>

    <div class="main-content">
        
        <h2 style="margin-bottom:20px; color:#333;">Welcome back, ${userName}!</h2>
        
        <div class="stats-grid">
            <div class="card">
                <div>
                    <h1>96%</h1>
                    <span>Attendance</span>
                </div>
                <i class="fa-solid fa-clock card-icon"></i>
            </div>
            
            <div class="card">
                <div>
                    <h1>12</h1>
                    <span>Leaves Taken</span>
                </div>
                <i class="fa-solid fa-calendar-minus card-icon"></i>
            </div>
            
            <div class="card">
                <div>
                    <h1>$8,500</h1>
                    <span>Next Payout</span>
                </div>
                <i class="fa-solid fa-wallet card-icon"></i>
            </div>
        </div>

        <div class="notice-box">
            <h2>Company Notices</h2>
            <table class="notice-table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="notice" items="${notices}">
                        <tr>
                            <td>
                                <strong>${notice.title}</strong><br>
                                <span style="font-size:12px; color:#666;">${notice.audience}</span>
                            </td>
                            <td>${notice.date}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty notices}">
                        <tr><td colspan="2">No notices available.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>