<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apply Leave - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-user-tie"></i> Employee Panel</h3>
        <a href="dashboard-emp" class="menu-item"><i class="fa-solid fa-house"></i> My Dashboard</a>
        <a href="my-attendance" class="menu-item"><i class="fa-solid fa-calendar-check"></i> My Attendance</a>
        <a href="my-salary" class="menu-item"><i class="fa-solid fa-file-invoice-dollar"></i> My Salary</a>
        <a href="apply-leave" class="menu-item active"><i class="fa-solid fa-mug-hot"></i> Apply Leave</a>
        <a href="dashboard-emp" class="menu-item"><i class="fa-solid fa-bell"></i> Notices</a>
        <form action="auth" method="POST" style="margin-top: auto;">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="menu-item" style="border:none; background:none; cursor:pointer; width:100%;">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </button>
        </form>
    </div>

    <div class="main-content">
        <h2 style="margin-bottom: 20px;">Leave Application</h2>

        <div class="notice-grid">
            
            <div class="form-card">
                <h3 style="margin-bottom:20px; color:#1976d2;">New Application</h3>
                <form action="apply-leave" method="POST">
                    
                    <div class="form-group">
                        <label>Leave Type</label>
                        <select name="type" class="form-control">
                            <option>Sick Leave</option>
                            <option>Casual Leave</option>
                            <option>Emergency</option>
                        </select>
                    </div>

                    <div style="display:flex; gap:10px;">
                        <div class="form-group" style="flex:1;">
                            <label>Start Date</label>
                            <input type="date" name="start" class="form-control" required>
                        </div>
                        <div class="form-group" style="flex:1;">
                            <label>End Date</label>
                            <input type="date" name="end" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Reason</label>
                        <textarea name="reason" class="form-control" placeholder="Why do you need leave?" required></textarea>
                    </div>

                    <button type="submit" class="btn-submit">Submit Request</button>
                </form>
            </div>

            <div class="notice-list-card">
                <table class="notice-table">
                    <thead style="background: #1e3a8a; color: white;">
                        <tr>
                            <th style="padding:15px;">Type</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="l" items="${myLeaves}">
                            <tr>
                                <td style="padding:15px; border-bottom:1px solid #eee;">
                                    <strong>${l.type}</strong><br>
                                    <span style="font-size:12px; color:#666;">${l.dates}</span>
                                </td>
                                <td style="padding:15px; border-bottom:1px solid #eee;">
                                    <span class="status-pill ${l.status}">${l.status}</span>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty myLeaves}">
                            <tr><td colspan="2" style="padding:20px; text-align:center;">No history found.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>