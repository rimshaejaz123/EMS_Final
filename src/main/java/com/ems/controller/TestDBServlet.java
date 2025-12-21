package com.ems.controller;

import com.ems.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/test-db")
public class TestDBServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        Connection con = DBConnection.getConnection();

        if (con != null) {
            out.println("<h2 style='color:green'>Database Connected Successfully</h2>");
        } else {
            out.println("<h2 style='color:red'>Database Connection Failed</h2>");
        }
    }
}
