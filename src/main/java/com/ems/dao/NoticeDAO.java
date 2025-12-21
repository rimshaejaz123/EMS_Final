package com.ems.dao;

import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NoticeDAO {

    // Method to fetch all notices
    public List<Map<String, String>> getAllNotices() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT n.notice_id, n.title, n.content, n.audience, n.created_at, u.full_name " +
                     "FROM notices n JOIN users u ON n.created_by = u.user_id " +
                     "ORDER BY n.created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", String.valueOf(rs.getInt("notice_id")));
                map.put("title", rs.getString("title"));
                map.put("content", rs.getString("content"));
                map.put("audience", rs.getString("audience"));
                map.put("date", rs.getTimestamp("created_at").toString());
                map.put("author", rs.getString("full_name"));
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to create a new notice
    public boolean createNotice(String title, String content, String audience, int userId) {
        String sql = "INSERT INTO notices (title, content, audience, created_by) VALUES (?, ?, ?, ?)";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, audience);
            ps.setInt(4, userId);
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}