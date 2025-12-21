package com.ems.controller;

import com.ems.dao.LeaveDAO;
import com.ems.model.User;
import com.ems.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

@WebServlet("/apply-leave")
public class LeaveApplyServlet extends HttpServlet {

    private LeaveDAO leaveDAO;

    public void init() {
        leaveDAO = new LeaveDAO();
    }

    // GET: Show Form and History
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if(user != null) {
            int empId = getEmpIdFromUserId(user.getUserId());
            List<Map<String, String>> myLeaves = leaveDAO.getLeavesByEmpId(empId);
            request.setAttribute("myLeaves", myLeaves);
            request.getRequestDispatcher("leave_apply.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    // POST: Submit New Leave
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if(user != null) {
            int empId = getEmpIdFromUserId(user.getUserId());
            String type = request.getParameter("type");
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            String reason = request.getParameter("reason");

            leaveDAO.applyLeave(empId, type, start, end, reason);
        }
        response.sendRedirect("apply-leave");
    }

    // Helper to find emp_id from user_id
    private int getEmpIdFromUserId(int userId) {
        int empId = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT emp_id FROM employees WHERE user_id = ?")) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) empId = rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return empId;
    }
}