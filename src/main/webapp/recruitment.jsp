<%-- 
    Document   : recruitment
    Created on : 16 Dec 2025, 19:16:59
    Author     : Rimsha
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recruitment - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .rec-grid {
            display: grid;
            grid-template-columns: 1.5fr 2fr 1.5fr 1fr 2fr;
            gap: 15px;
            padding: 15px;
            align-items: center;
            border-bottom: 1px solid #eee;
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
        <a href="salaries" class="menu-item"><i class="fa-solid fa-money-bill-wave"></i> Salaries</a>
        <a href="notices" class="menu-item"><i class="fa-solid fa-circle-exclamation"></i> Issue Notices</a>
        <a href="leaves" class="menu-item"><i class="fa-solid fa-calendar-xmark"></i> Leaves</a>
        
        <a href="attendances" class="menu-item"><i class="fa-solid fa-clipboard-user"></i> Attendances</a>
        
        <a href="recruitment" class="menu-item active"><i class="fa-solid fa-user-plus"></i> Recruitment</a>
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
            <h1 style="font-size: 28px;">Recruitment Pipeline</h1>
            <a href="#" class="btn-add">Add Candidate</a>
        </div>

        <div class="emp-container">
            <div class="rec-grid" style="background: #1e3a8a; color: white; border-radius: 5px;">
                <div>Name</div>
                <div>Email</div>
                <div>Position</div>
                <div>Status</div>
                <div>Update Status</div>
            </div>

            <c:forEach var="c" items="${candidateList}">
                <div class="rec-grid">
                    <div style="font-weight:600;">${c.name}</div>
                    <div>${c.email}</div>
                    <div>${c.position}</div>
                    <div><span class="status-pill ${c.status}">${c.status}</span></div>
                    
                    <div>
                        <form action="recruitment" method="POST">
                            <input type="hidden" name="id" value="${c.id}">
                            
                            <button type="submit" name="status" value="Interviewed" class="action-sm" title="Mark Interviewed">🎤 Interview</button>
                            <button type="submit" name="status" value="Selected" class="action-sm" style="color:green;" title="Select Candidate">✔ Select</button>
                            <button type="submit" name="status" value="Rejected" class="action-sm" style="color:red;" title="Reject Candidate">✖ Reject</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty candidateList}">
                <p style="padding:20px; text-align:center;">No candidates found.</p>
            </c:if>
        </div>

    </div>
</div>

</body>
</html>