package com.ems.controller;

import com.ems.dao.SalaryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/salaries")
public class SalaryServlet extends HttpServlet {

    private SalaryDAO salaryDAO;

    public void init() {
        salaryDAO = new SalaryDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Map<String, String>> salaries = salaryDAO.getAllSalaries();
        
        request.setAttribute("salaryList", salaries);
        request.getRequestDispatcher("salaries.jsp").forward(request, response);
    }
}