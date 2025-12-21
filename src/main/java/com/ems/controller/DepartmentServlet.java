package com.ems.controller;

import com.ems.dao.DepartmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/departments")
public class DepartmentServlet extends HttpServlet {

    private DepartmentDAO deptDAO;

    public void init() {
        deptDAO = new DepartmentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Map<String, String>> depts = deptDAO.getAllDepartments();
        
        request.setAttribute("deptList", depts);
        request.getRequestDispatcher("departments.jsp").forward(request, response);
    }
}