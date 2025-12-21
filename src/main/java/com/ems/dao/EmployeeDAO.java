package com.ems.dao;

import com.ems.model.Employee;
import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    // Method to Get All Employees (with Status fix)
    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        
        // FIX: Changed 'e.status' to 'u.status' because employees table doesn't have a status column
        // We join users (u) to get the correct status
        String sql = "SELECT e.emp_id, u.full_name, u.email, e.designation, d.dept_name, e.join_date, u.status " +
                     "FROM employees e " +
                     "JOIN users u ON e.user_id = u.user_id " +
                     "LEFT JOIN departments d ON e.dept_id = d.dept_id " +
                     "ORDER BY e.emp_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setId(rs.getInt("emp_id"));
                emp.setName(rs.getString("full_name"));
                emp.setEmail(rs.getString("email"));
                emp.setDesignation(rs.getString("designation"));
                
                // Handle null department names gracefully
                String dName = rs.getString("dept_name");
                emp.setDepartment(dName != null ? dName : "Not Assigned");
                
                emp.setJoinDate(rs.getDate("join_date").toString());
                
                // FIX: Fetching status from the 'users' table column
                emp.setStatus(rs.getString("status")); 
                emp.setType(rs.getString("status")); 
                
                list.add(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // NEW METHOD: Add New Employee (Transaction: User + Employee)
    public boolean addEmployee(Employee emp, String password, int deptId) {
        boolean isSuccess = false;
        Connection con = null;
        
        // SQL 1: Create User
        String userSql = "INSERT INTO users (full_name, email, password, role, status) VALUES (?, ?, ?, 'EMPLOYEE', 'ACTIVE')";
        
        // SQL 2: Create Employee Profile
        String empSql = "INSERT INTO employees (user_id, dept_id, designation, contact_number, join_date) VALUES (?, ?, ?, ?, ?)";

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false); // Start Transaction

            // 1. Insert User
            int userId = -1;
            try (PreparedStatement psUser = con.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS)) {
                psUser.setString(1, emp.getName());
                psUser.setString(2, emp.getEmail());
                psUser.setString(3, password); // In a real app, hash this!
                
                int affectedRows = psUser.executeUpdate();
                if (affectedRows == 0) throw new SQLException("Creating user failed, no rows affected.");

                try (ResultSet generatedKeys = psUser.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        userId = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
            }

            // 2. Insert Employee using the new User ID
            try (PreparedStatement psEmp = con.prepareStatement(empSql)) {
                psEmp.setInt(1, userId);
                psEmp.setInt(2, deptId);
                psEmp.setString(3, emp.getDesignation());
                psEmp.setString(4, "0000000000"); // Placeholder for contact number
                // Note: We use the passed JoinDate
                psEmp.setString(5, emp.getJoinDate()); 
                
                psEmp.executeUpdate();
            }

            con.commit(); // Commit Transaction
            isSuccess = true;

        } catch (Exception e) {
            e.printStackTrace();
            try { if (con != null) con.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
        } finally {
            try { if (con != null) con.setAutoCommit(true); con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return isSuccess;
    }
}