<%-- 
    Document   : notices
    Created on : 16 Dec 2025, 19:10:11
    Author     : Rimsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Issue Notices - EMS</title>
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
        <a href="notices" class="menu-item active"><i class="fa-solid fa-circle-exclamation"></i> Issue Notices</a>
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
            <h1 style="font-size: 28px;">Issue Notices</h1>
        </div>

        <div class="notice-grid">
            
            <div class="form-card">
                <h3 style="margin-bottom:20px; color:#1976d2;">Create New Notice</h3>
                <form action="notices" method="POST">
                    
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" name="title" class="form-control" required placeholder="e.g. Server Maintenance">
                    </div>

                    <div class="form-group">
                        <label>Audience</label>
                        <select name="audience" class="form-control">
                            <option value="All">All Employees</option>
                            <option value="Department">Department Heads Only</option>
                            <option value="HR">HR Team</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Content</label>
                        <textarea name="content" class="form-control" required placeholder="Write the details here..."></textarea>
                    </div>

                    <button type="submit" class="btn-submit">Publish Notice</button>
                </form>
            </div>

            <div class="notice-list-card">
                <table class="notice-table" style="width:100%; margin:0;">
                    <thead style="background: #1e3a8a; color: white;">
                        <tr>
                            <th style="padding:15px;">Title</th>
                            <th style="padding:15px;">Audience</th>
                            <th style="padding:15px;">Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="n" items="${noticeList}">
                            <tr>
                                <td style="padding:15px; border-bottom:1px solid #eee;">
                                    <strong>${n.title}</strong><br>
                                    <span style="font-size:12px; color:#666;">${n.content}</span>
                                </td>
                                <td style="padding:15px; border-bottom:1px solid #eee;">
                                    <span style="background:#e3f2fd; color:#1976d2; padding:4px 8px; border-radius:4px; font-size:12px;">${n.audience}</span>
                                </td>
                                <td style="padding:15px; border-bottom:1px solid #eee; font-size:13px; color:#888;">
                                    ${n.date}
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty noticeList}">
                            <tr><td colspan="3" style="padding:20px; text-align:center;">No notices found.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

        </div>

    </div>
</div>

</body>
</html>