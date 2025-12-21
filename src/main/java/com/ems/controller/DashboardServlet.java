package com.ems.controller;

import com.ems.dao.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/dashboard-hr")
public class DashboardServlet extends HttpServlet {

    private DashboardDAO dashboardDAO;

    public void init() {
        dashboardDAO = new DashboardDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Security Check: Ensure user is logged in
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 1. Fetch Dashboard Stats (Renamed method)
        Map<String, Integer> stats = dashboardDAO.getDashboardStats();
        request.setAttribute("stats", stats);
        
        // 2. Fetch Recent Notices
        List<Map<String, String>> notices = dashboardDAO.getRecentNotices();
        request.setAttribute("notices", notices);

        // 3. NEW: Fetch Chart Data (Departments vs Employee Count)
        List<Map<String, Object>> chartData = dashboardDAO.getDepartmentStats();
        request.setAttribute("chartData", chartData);
        
        request.getRequestDispatcher("dashboard_hr.jsp").forward(request, response);
    }
}