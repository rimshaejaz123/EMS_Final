package com.ems.model;

import java.io.Serializable;

public class User implements Serializable {
    private int userId;
    private String fullName;
    private String email;
    private String password;
    private int roleId; // 1 = HR, 2 = Employee
    private String status;

    public User() {}

    public User(String fullName, String email, String password, int roleId) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.roleId = roleId;
        this.status = "ACTIVE";
    }

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public int getRoleId() { return roleId; }
    public void setRoleId(int roleId) { this.roleId = roleId; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}