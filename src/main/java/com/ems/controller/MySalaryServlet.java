package com.ems.controller;

import com.ems.dao.SalaryDAO;
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

@WebServlet("/my-salary")
public class MySalaryServlet extends HttpServlet {

    private SalaryDAO salaryDAO;

    @Override
    public void init() {
        salaryDAO = new SalaryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if(user != null) {
            int empId = getEmpIdFromUserId(user.getUserId());
            
            List<Map<String, String>> mySalaries = salaryDAO.getSalariesByEmpId(empId);
            request.setAttribute("salaryList", mySalaries);
            
            request.getRequestDispatcher("my_salary.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    // Helper: Find emp_id from user_id
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