package com.ems.controller;

import com.ems.dao.AttendanceDAO;
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

@WebServlet("/my-attendance")
public class MyAttendanceServlet extends HttpServlet {

    private AttendanceDAO attendanceDAO;

    public void init() {
        attendanceDAO = new AttendanceDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if(user != null) {
            int empId = getEmpIdFromUserId(user.getUserId());
            
            List<Map<String, String>> myAttendance = attendanceDAO.getAttendanceByEmpId(empId);
            request.setAttribute("attendanceList", myAttendance);
            
            request.getRequestDispatcher("my_attendance.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

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