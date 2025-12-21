<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Leave Management - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .leave-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr 1.5fr 2fr 1fr 1.5fr;
            gap: 10px;
            padding: 15px 10px;
            align-items: center;
            border-bottom: 1px solid #eee;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }
        .PENDING { background: #fff3cd; color: #856404; }
        .APPROVED { background: #d4edda; color: #155724; }
        .REJECTED { background: #f8d7da; color: #721c24; }

        .btn-action {
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            color: white;
            font-size: 12px;
            margin-right: 5px;
        }
        .btn-approve { background: #28a745; }
        .btn-reject { background: #dc3545; }
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
        <a href="leaves" class="menu-item active"><i class="fa-solid fa-calendar-xmark"></i> Leaves</a>
        
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
            <h1 style="font-size: 28px;">Leave Requests</h1>
        </div>

        <div class="emp-container">
            <div class="leave-grid" style="background: #1e3a8a; color: white; border-radius: 5px;">
                <div>Employee</div>
                <div>Type</div>
                <div>Dates</div>
                <div>Reason</div>
                <div>Status</div>
                <div>Actions</div>
            </div>

            <c:forEach var="l" items="${leaveList}">
                <div class="leave-grid">
                    <div style="font-weight:600;">${l.name}</div>
                    <div>${l.type}</div>
                    <div style="font-size:13px;">${l.dates}</div>
                    <div style="font-size:13px; color:#555;">${l.reason}</div>
                    <div><span class="status-badge ${l.status}">${l.status}</span></div>
                    
                    <div>
                        <c:if test="${l.status == 'PENDING'}">
                            <form action="leaves" method="POST" style="display:inline;">
                                <input type="hidden" name="id" value="${l.id}">
                                <button type="submit" name="action" value="approve" class="btn-action btn-approve">✔</button>
                                <button type="submit" name="action" value="reject" class="btn-action btn-reject">✖</button>
                            </form>
                        </c:if>
                        <c:if test="${l.status != 'PENDING'}">
                            <span style="color:#aaa; font-size:12px;">Completed</span>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty leaveList}">
                <p style="padding:20px; text-align:center;">No pending leave requests.</p>
            </c:if>
        </div>

    </div>
</div>

</body>
</html>