package com.ems.dao;

import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AttendanceDAO {

    // 1. EMPLOYEE: Get Attendance History for Logged-in User
    public List<Map<String, String>> getAttendanceByEmpId(int empId) {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM attendance WHERE emp_id = ? ORDER BY attendance_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, empId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("date", rs.getDate("attendance_date").toString());
                map.put("status", rs.getString("status"));
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. HR: See Daily Attendance Sheet for ALL Employees
    public List<Map<String, String>> getDailyAttendance(String date) {
        List<Map<String, String>> list = new ArrayList<>();
        // Left Join ensures we see ALL employees, even if they haven't marked attendance yet
        String sql = "SELECT u.full_name, d.dept_name, a.status " +
                     "FROM employees e " +
                     "JOIN users u ON e.user_id = u.user_id " +
                     "LEFT JOIN departments d ON e.dept_id = d.dept_id " +
                     "LEFT JOIN attendance a ON e.emp_id = a.emp_id AND a.attendance_date = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("name", rs.getString("full_name"));
                map.put("dept", rs.getString("dept_name"));
                String status = rs.getString("status");
                map.put("status", status != null ? status : "NOT MARKED");
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}