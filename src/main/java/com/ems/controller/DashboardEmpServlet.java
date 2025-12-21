package com.ems.controller;

import com.ems.dao.DashboardDAO;
import com.ems.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/dashboard-emp")
public class DashboardEmpServlet extends HttpServlet {

    private DashboardDAO dashboardDAO;

    public void init() {
        dashboardDAO = new DashboardDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        
        // Re-use the existing DAO to get notices (Employees see the same notices for now)
        List<Map<String, String>> notices = dashboardDAO.getRecentNotices();

        request.setAttribute("notices", notices);
        request.setAttribute("userName", user.getFullName());
        
        request.getRequestDispatcher("dashboard_emp.jsp").forward(request, response);
    }
}