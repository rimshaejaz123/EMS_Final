package com.ems.dao;

import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SalaryDAO {

    // Method to get ALL salaries (Used by HR)
    public List<Map<String, String>> getAllSalaries() {
        List<Map<String, String>> list = new ArrayList<>();
        // Join Salaries -> Employees -> Users to get the Name
        String sql = "SELECT s.salary_id, u.full_name, s.basic_salary, s.bonus, s.deductions, s.month, s.year " +
                     "FROM salaries s " +
                     "JOIN employees e ON s.emp_id = e.emp_id " +
                     "JOIN users u ON e.user_id = u.user_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", String.valueOf(rs.getInt("salary_id")));
                map.put("name", rs.getString("full_name"));
                map.put("basic", rs.getString("basic_salary"));
                map.put("bonus", rs.getString("bonus"));
                map.put("deduction", rs.getString("deductions"));
                map.put("month", rs.getString("month") + " " + rs.getInt("year"));
                
                // Calculate Total Net Salary
                double basic = rs.getDouble("basic_salary");
                double bonus = rs.getDouble("bonus");
                double ded = rs.getDouble("deductions");
                double total = basic + bonus - ded;
                map.put("total", String.format("%.2f", total));
                
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Fetch specific salary record for the Printable Slip
    public Map<String, String> getSalaryById(int salaryId) {
        Map<String, String> map = null;
        String sql = "SELECT s.*, u.full_name, u.email, d.dept_name, e.designation, e.join_date " +
                     "FROM salaries s " +
                     "JOIN employees e ON s.emp_id = e.emp_id " +
                     "JOIN users u ON e.user_id = u.user_id " +
                     "LEFT JOIN departments d ON e.dept_id = d.dept_id " +
                     "WHERE s.salary_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, salaryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    map = new HashMap<>();
                    map.put("id", String.valueOf(rs.getInt("salary_id")));
                    map.put("name", rs.getString("full_name"));
                    map.put("email", rs.getString("email"));
                    map.put("dept", rs.getString("dept_name")); // Handle null if needed in UI
                    map.put("designation", rs.getString("designation"));
                    map.put("month", rs.getString("month") + " " + rs.getInt("year"));
                    
                    double basic = rs.getDouble("basic_salary");
                    double bonus = rs.getDouble("bonus");
                    double ded = rs.getDouble("deductions");
                    double total = basic + bonus - ded;
                    
                    map.put("basic", String.format("%.2f", basic));
                    map.put("bonus", String.format("%.2f", bonus));
                    map.put("deduction", String.format("%.2f", ded));
                    map.put("total", String.format("%.2f", total));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    // FIXED: Method to get salary history for a specific employee (Used by Employee Dashboard)
    public List<Map<String, String>> getSalariesByEmpId(int empId) {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM salaries WHERE emp_id = ? ORDER BY year DESC, month DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, empId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("month", rs.getString("month") + " " + rs.getInt("year"));
                map.put("basic", rs.getString("basic_salary"));
                map.put("bonus", rs.getString("bonus"));
                map.put("deduction", rs.getString("deductions"));
                
                // Calculate Total
                double basic = rs.getDouble("basic_salary");
                double bonus = rs.getDouble("bonus");
                double ded = rs.getDouble("deductions");
                double total = basic + bonus - ded;
                map.put("total", String.format("%.2f", total));
                
                // Add the ID so the employee can also view the Printable Slip
                map.put("id", String.valueOf(rs.getInt("salary_id")));
                
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}