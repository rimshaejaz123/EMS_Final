package com.ems.controller;

import com.ems.dao.LeaveDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/leaves")
public class LeaveServlet extends HttpServlet {

    private LeaveDAO leaveDAO;

    public void init() {
        leaveDAO = new LeaveDAO();
    }

    // Show the list
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Map<String, String>> leaves = leaveDAO.getAllLeaves();
        request.setAttribute("leaveList", leaves);
        request.getRequestDispatcher("leaves.jsp").forward(request, response);
    }

    // Handle Approve/Reject buttons
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action"); // "approve" or "reject"
        
        String status = action.equals("approve") ? "APPROVED" : "REJECTED";
        
        leaveDAO.updateStatus(id, status);
        
        response.sendRedirect("leaves");
    }
}