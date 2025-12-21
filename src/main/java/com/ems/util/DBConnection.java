package com.ems.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
        "jdbc:mysql://localhost:3306/ems_db?useSSL=false&serverTimezone=UTC";

    private static final String USER = "root";   // XAMPP default
    private static final String PASS = "";       // XAMPP default

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
