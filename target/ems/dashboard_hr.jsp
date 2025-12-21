<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>HR Dashboard - EMS</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="dashboard-container">
    
    <div class="sidebar">
        <h3><i class="fa-solid fa-clock"></i> Dashboard</h3>
        
        <a href="dashboard-hr" class="menu-item active">
            <i class="fa-solid fa-house"></i> Dashboard
        </a>
        <a href="employees" class="menu-item"><i class="fa-solid fa-users"></i> Employees</a>
        <a href="departments" class="menu-item"><i class="fa-solid fa-sitemap"></i> Departments</a>
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
        
        <div class="stats-grid">
            <div class="card">
                <div>
                    <h1>${stats.employees}</h1>
                    <span>Employees</span>
                </div>
                <i class="fa-solid fa-id-card card-icon"></i>
            </div>
            
            <div class="card">
                <div>
                    <h1>${stats.departments}</h1>
                    <span>Departments</span>
                </div>
                <i class="fa-solid fa-network-wired card-icon"></i>
            </div>
            
            <div class="card">
                <div>
                    <h1>${stats.leaves}</h1>
                    <span>Leaves</span>
                </div>
                <i class="fa-solid fa-calendar-minus card-icon"></i>
            </div>
            
            <div class="card">
                <div>
                    <h1>${stats.requests}</h1>
                    <span>Requests</span>
                </div>
                <i class="fa-solid fa-comments card-icon"></i>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px;">
            
            <div class="card" style="display:block; height:auto; background:white; color:black; cursor:default;">
                <h3 style="margin-bottom:15px; border-bottom:1px solid #eee; padding-bottom:10px;">
                    <i class="fa-solid fa-chart-pie"></i> Department Distribution
                </h3>
                <div style="height: 250px;">
                    <canvas id="deptChart"></canvas>
                </div>
            </div>

            <div class="card" style="display:block; height:auto; background:white; color:black; cursor:default;">
                 <h3 style="margin-bottom:15px; border-bottom:1px solid #eee; padding-bottom:10px;">
                    <i class="fa-solid fa-bolt"></i> Quick Actions
                </h3>
                <div style="display:grid; gap:10px;">
                    <a href="add_employee.jsp" class="btn" style="text-align:center; background:#1976d2;">+ Add Employee</a>
                    <a href="notices" class="btn" style="text-align:center; background:#388e3c;">+ Post Notice</a>
                    <a href="recruitment" class="btn" style="text-align:center; background:#f57c00;">View Applications</a>
                </div>
            </div>
        </div>

        <div class="content-grid">
            
            <div class="chart-box">
                <h2>Balance Chart</h2>
                <p style="color:#666; font-size:14px; margin-bottom: 20px;">Available Salary Amount: <strong>$850,000</strong></p>
                <canvas id="salaryChart"></canvas>
            </div>

            <div class="notice-box">
                <h2>Recent Notices</h2>
                <table class="notice-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Audience</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="notice" items="${notices}">
                            <tr>
                                <td>${notice.id}</td>
                                <td>${notice.title}</td>
                                <td><span style="background:#e3f2fd; color:#1976d2; padding:4px 8px; border-radius:4px; font-size:12px;">${notice.audience}</span></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty notices}">
                            <tr><td colspan="3">No recent notices found.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

<script>
    // --- 1. Existing Salary Chart (Static Demo) ---
    const ctx = document.getElementById('salaryChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
            datasets: [{
                label: 'Salary Fund Usage',
                data: [200000, 250000, 550000, 400000, 600000],
                borderColor: '#4a90e2',
                backgroundColor: 'rgba(74, 144, 226, 0.1)',
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } }
        }
    });

    // --- 2. NEW: Department Distribution Chart (Dynamic Data) ---
    
    // Prepare Data from Java (JSTL) to JavaScript Arrays
    var deptLabels = [ 
        <c:forEach var="d" items="${chartData}">
            "${d.name}", 
        </c:forEach> 
    ];
    
    var empCounts = [ 
        <c:forEach var="d" items="${chartData}">
            ${d.count}, 
        </c:forEach> 
    ];

    // Draw the Doughnut Chart
    var ctxDept = document.getElementById('deptChart').getContext('2d');
    new Chart(ctxDept, {
        type: 'doughnut',
        data: {
            labels: deptLabels,
            datasets: [{
                data: empCounts,
                backgroundColor: [
                    '#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', '#858796'
                ],
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'bottom' }
            }
        }
    });
</script>

</body>
</html>