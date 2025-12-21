package com.ems.dao;

import com.ems.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DepartmentDAO {

    public List<Map<String, String>> getAllDepartments() {
        List<Map<String, String>> deptList = new ArrayList<>();
        String sql = "SELECT * FROM departments";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, String> dept = new HashMap<>();
                dept.put("id", String.valueOf(rs.getInt("dept_id")));
                dept.put("name", rs.getString("dept_name"));
                dept.put("description", rs.getString("description"));
                deptList.add(dept);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deptList;
    }
}