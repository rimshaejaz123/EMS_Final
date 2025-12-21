package com.ems.dao;

import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LeaveDAO {

    // ---------------------------------------------------------
    // HR METHODS (EXISTING)
    // ---------------------------------------------------------

    // Get ALL leaves for HR Admin
    public List<Map<String, String>> getAllLeaves() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT l.leave_id, u.full_name, l.leave_type, l.start_date, l.end_date, l.reason, l.status " +
                     "FROM leaves l " +
                     "JOIN employees e ON l.emp_id = e.emp_id " +
                     "JOIN users u ON e.user_id = u.user_id " +
                     "ORDER BY l.applied_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", String.valueOf(rs.getInt("leave_id")));
                map.put("name", rs.getString("full_name"));
                map.put("type", rs.getString("leave_type"));
                map.put("dates", rs.getString("start_date") + " to " + rs.getString("end_date"));
                map.put("reason", rs.getString("reason"));
                map.put("status", rs.getString("status"));
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update status (Approve/Reject) for HR Admin
    public boolean updateStatus(int leaveId, String status) {
        String sql = "UPDATE leaves SET status = ? WHERE leave_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ps.setInt(2, leaveId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ---------------------------------------------------------
    // NEW EMPLOYEE METHODS (PHASE 11 ADDITIONS)
    // ---------------------------------------------------------

    // 1. Method for Employee to Apply for Leave
    public boolean applyLeave(int empId, String type, String start, String end, String reason) {
        String sql = "INSERT INTO leaves (emp_id, leave_type, start_date, end_date, reason, status) " +
                     "VALUES (?, ?, ?, ?, ?, 'PENDING')";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, empId);
            ps.setString(2, type);
            ps.setString(3, start);
            ps.setString(4, end);
            ps.setString(5, reason);
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. Method to get ONLY the logged-in employee's leaves
    public List<Map<String, String>> getLeavesByEmpId(int empId) {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM leaves WHERE emp_id = ? ORDER BY applied_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, empId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("type", rs.getString("leave_type"));
                map.put("dates", rs.getString("start_date") + " to " + rs.getString("end_date"));
                map.put("reason", rs.getString("reason"));
                map.put("status", rs.getString("status"));
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}