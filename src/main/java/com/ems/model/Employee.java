package com.ems.model;

public class Employee {
    private int id;
    private String name;
    private String email;
    private String designation;
    private String department;
    private String joinDate;
    private String status;
    private String type; // Used for extra status info like "Active/Inactive"

    // --- GETTERS AND SETTERS ---

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getJoinDate() { return joinDate; }
    public void setJoinDate(String joinDate) { this.joinDate = joinDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}