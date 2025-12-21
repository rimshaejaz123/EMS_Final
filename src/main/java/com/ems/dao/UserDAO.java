package com.ems.dao;

import com.ems.model.User;
import com.ems.util.DBConnection;
import java.sql.*;

public class UserDAO {

    // Login Method
    public User loginUser(String email, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE email = ? AND password = ? AND status = 'ACTIVE'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setRoleId(rs.getInt("role_id"));
                user.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Register Method
    public boolean registerUser(User user) {
        String query = "INSERT INTO users (full_name, email, password, role_id, status) VALUES (?, ?, ?, ?, 'ACTIVE')";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setInt(4, user.getRoleId());
            
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // NEW: Method to update basic profile info
    public boolean updateProfile(int userId, String fullName, String email) {
        String sql = "UPDATE users SET full_name = ?, email = ? WHERE user_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setInt(3, userId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // NEW: Method to change password
    public boolean changePassword(int userId, String newPassword) {
        String sql = "UPDATE users SET password = ? WHERE user_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}