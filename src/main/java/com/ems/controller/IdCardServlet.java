package com.ems.controller;

import com.ems.dao.EmployeeDAO;
import com.ems.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/id-card")
public class IdCardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id"); // Employee ID (emp_id)
        if(idParam != null) {
            Map<String, String> emp = getEmployeeForCard(Integer.parseInt(idParam));
            request.setAttribute("emp", emp);
            request.getRequestDispatcher("id_card.jsp").forward(request, response);
        }
    }

    // Helper method to fetch details specifically for the ID Card
    private Map<String, String> getEmployeeForCard(int empId) {
        Map<String, String> map = new HashMap<>();
        String sql = "SELECT u.full_name, u.email, e.designation, e.contact_number, e.join_date, d.dept_name " +
                     "FROM employees e " +
                     "JOIN users u ON e.user_id = u.user_id " +
                     "LEFT JOIN departments d ON e.dept_id = d.dept_id " +
                     "WHERE e.emp_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, empId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                map.put("name", rs.getString("full_name"));
                map.put("email", rs.getString("email"));
                map.put("designation", rs.getString("designation"));
                map.put("phone", rs.getString("contact_number"));
                map.put("dept", rs.getString("dept_name"));
                map.put("joined", rs.getString("join_date"));
                // Add a fake ID number for the barcode
                map.put("code", "EMS-" + (1000 + empId)); 
            }
        } catch (Exception e) { e.printStackTrace(); }
        return map;
    }
}