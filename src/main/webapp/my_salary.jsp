<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Salary - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .salary-card-row {
            display: grid;
            /* Updated grid to 7 columns to fit the new button */
            grid-template-columns: 2fr 1fr 1fr 1fr 1.2fr 1fr 1fr;
            gap: 15px;
            padding: 20px;
            background: white;
            border-bottom: 1px solid #eee;
            align-items: center;
        }
        .salary-head {
            background: #1e3a8a; 
            color: white; 
            font-weight: 600; 
            border-radius: 5px 5px 0 0;
        }
        /* Added style for the button */
        .action-btn {
            display: inline-block;
            text-decoration: none;
            background: #1976d2;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
            transition: background 0.3s;
        }
        .action-btn:hover {
            background: #115293;
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-user-tie"></i> Employee Panel</h3>
        <a href="dashboard-emp" class="menu-item"><i class="fa-solid fa-house"></i> My Dashboard</a>
        <a href="my-attendance" class="menu-item"><i class="fa-solid fa-calendar-check"></i> My Attendance</a>
        <a href="my-salary" class="menu-item active"><i class="fa-solid fa-file-invoice-dollar"></i> My Salary</a>
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
        <div class="page-header">
            <h1 style="font-size: 28px;">My Salary History</h1>
        </div>

        <div class="emp-container" style="padding:0; overflow:hidden;">
            <div class="salary-card-row salary-head">
                <div>Month/Year</div>
                <div>Basic</div>
                <div>Bonus</div>
                <div>Deductions</div>
                <div>Net Pay</div>
                <div>Status</div>
                <div>Slip</div> </div>

            <c:forEach var="s" items="${salaryList}">
                <div class="salary-card-row">
                    <div style="font-weight:600; color:#333;">${s.month}</div>
                    <div style="color:#555;">$${s.basic}</div>
                    <div style="color:green;">+$${s.bonus}</div>
                    <div style="color:red;">-$${s.deduction}</div>
                    <div style="font-size:16px; font-weight:bold; color:#1976d2;">$${s.total}</div>
                    <div>
                        <span style="background:#d4edda; color:#155724; padding:5px 10px; border-radius:15px; font-size:12px; font-weight:600;">PAID</span>
                    </div>
                    <div>
                        <a href="salary-slip?id=${s.id}" target="_blank" class="action-btn">View Slip</a>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty salaryList}">
                <p style="padding:30px; text-align:center; color:#666;">No salary records found for you.</p>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>