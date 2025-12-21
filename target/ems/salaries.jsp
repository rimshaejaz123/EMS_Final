<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Salaries - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Adjust grid for salary columns */
        .salary-header-row, .salary-row {
            display: grid;
            grid-template-columns: 2fr 1.5fr 1fr 1fr 1.5fr 1fr;
            gap: 10px;
            padding: 15px 10px;
            align-items: center;
        }
        .salary-row { border-bottom: 1px solid #1976d2; }
        
        .action-btn {
            display: inline-block;
            padding: 5px 10px;
            background-color: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 0.9em;
            transition: background 0.3s;
        }
        .action-btn:hover {
            background-color: #115293;
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-clock"></i> Dashboard</h3>
        
        <a href="dashboard-hr" class="menu-item"><i class="fa-solid fa-house"></i> Dashboard</a>
        <a href="employees" class="menu-item"><i class="fa-solid fa-users"></i> Employees</a>
        <a href="departments" class="menu-item"><i class="fa-solid fa-sitemap"></i> Departments</a>
        <a href="salaries" class="menu-item active"><i class="fa-solid fa-money-bill-wave"></i> Salaries</a>
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
            <h1 style="font-size: 28px;">Salary Management</h1>
            <a href="#" class="btn-add">Add Salary</a>
        </div>

        <div class="emp-container">
            <div class="salary-header-row">
                <div class="header-cell">Employee Name</div>
                <div class="header-cell">Month/Year</div>
                <div class="header-cell">Basic</div>
                <div class="header-cell">Bonus</div>
                <div class="header-cell">Total Payout</div>
                <div class="header-cell">Action</div>
            </div>

            <c:forEach var="s" items="${salaryList}">
                <div class="salary-row">
                    <div class="emp-cell text-left"><strong>${s.name}</strong></div>
                    <div class="emp-cell"><strong>${s.month}</strong></div>
                    <div class="emp-cell">$${s.basic}</div>
                    <div class="emp-cell" style="color:green;">+$${s.bonus}</div>
                    <div class="emp-cell" style="font-weight:bold; color:#1976d2;">$${s.total}</div>
                    <div class="emp-cell">
                        <a href="salary-slip?id=${s.id}" target="_blank" class="action-btn">View Slip</a>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty salaryList}">
                <p style="text-align:center; padding:20px;">No salary records found.</p>
            </c:if>
        </div>

    </div>
</div>

</body>
</html>