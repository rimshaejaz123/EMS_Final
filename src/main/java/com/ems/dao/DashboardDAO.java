package com.ems.dao;

import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DashboardDAO {

    // Renamed to 'getDashboardStats' to match the Servlet call
    public Map<String, Integer> getDashboardStats() {
        Map<String, Integer> stats = new HashMap<>();
        try (Connection con = DBConnection.getConnection()) {
            
            // Count Employees
            try (PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM employees");
                 ResultSet rs1 = ps1.executeQuery()) {
                if(rs1.next()) stats.put("employees", rs1.getInt(1));
            }

            // Count Departments
            try (PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM departments");
                 ResultSet rs2 = ps2.executeQuery()) {
                if(rs2.next()) stats.put("departments", rs2.getInt(1));
            }

            // Count Leaves (Pending)
            try (PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM leaves");
                 ResultSet rs3 = ps3.executeQuery()) {
                if(rs3.next()) stats.put("leaves", rs3.getInt(1));
            }

            // Count Requests (Candidates)
            try (PreparedStatement ps4 = con.prepareStatement("SELECT COUNT(*) FROM candidates");
                 ResultSet rs4 = ps4.executeQuery()) {
                if(rs4.next()) stats.put("requests", rs4.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }

    public List<Map<String, String>> getRecentNotices() {
        List<Map<String, String>> notices = new ArrayList<>();
        String sql = "SELECT notice_id, title, audience, created_at FROM notices ORDER BY created_at DESC LIMIT 5";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                Map<String, String> notice = new HashMap<>();
                notice.put("id", String.valueOf(rs.getInt("notice_id")));
                notice.put("title", rs.getString("title"));
                notice.put("audience", rs.getString("audience"));
                notice.put("date", rs.getTimestamp("created_at").toString());
                notices.add(notice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notices;
    }

    // NEW METHOD: Fetch stats for the Chart (Department Name vs Employee Count)
    public List<Map<String, Object>> getDepartmentStats() {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT d.dept_name, COUNT(e.emp_id) as count " +
                     "FROM departments d " +
                     "LEFT JOIN employees e ON d.dept_id = e.dept_id " +
                     "GROUP BY d.dept_name";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("name", rs.getString("dept_name"));
                map.put("count", rs.getInt("count"));
                list.add(map);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}