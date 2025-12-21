package com.ems.dao;

import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CandidateDAO {

    public List<Map<String, String>> getAllCandidates() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM candidates ORDER BY applied_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", String.valueOf(rs.getInt("candidate_id")));
                map.put("name", rs.getString("full_name"));
                map.put("email", rs.getString("email"));
                map.put("position", rs.getString("position"));
                map.put("status", rs.getString("status"));
                map.put("date", rs.getTimestamp("applied_at").toString());
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateStatus(int id, String newStatus) {
        String sql = "UPDATE candidates SET status = ? WHERE candidate_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}