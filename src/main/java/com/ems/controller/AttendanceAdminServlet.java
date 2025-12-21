package com.ems.controller;

import com.ems.dao.AttendanceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet("/attendances")
public class AttendanceAdminServlet extends HttpServlet {

    private AttendanceDAO attendanceDAO;

    public void init() {
        attendanceDAO = new AttendanceDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String date = request.getParameter("date");
        
        // Default to today if no date selected
        if(date == null || date.isEmpty()) {
            date = LocalDate.now().toString();
        }
        
        List<Map<String, String>> dailyList = attendanceDAO.getDailyAttendance(date);
        
        request.setAttribute("selectedDate", date);
        request.setAttribute("dailyList", dailyList);
        request.getRequestDispatcher("attendance_admin.jsp").forward(request, response);
    }
}