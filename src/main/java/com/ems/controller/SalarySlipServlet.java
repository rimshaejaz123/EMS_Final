package com.ems.controller;

import com.ems.dao.SalaryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/salary-slip")
public class SalarySlipServlet extends HttpServlet {

    private SalaryDAO salaryDAO;

    public void init() { salaryDAO = new SalaryDAO(); }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if(idParam != null) {
            int id = Integer.parseInt(idParam);
            Map<String, String> slip = salaryDAO.getSalaryById(id);
            request.setAttribute("slip", slip);
            request.getRequestDispatcher("salary_slip.jsp").forward(request, response);
        }
    }
}