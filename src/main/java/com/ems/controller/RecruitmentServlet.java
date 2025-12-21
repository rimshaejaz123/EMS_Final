package com.ems.controller;

import com.ems.dao.CandidateDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/recruitment")
public class RecruitmentServlet extends HttpServlet {

    private CandidateDAO candidateDAO;

    public void init() {
        candidateDAO = new CandidateDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Map<String, String>> candidates = candidateDAO.getAllCandidates();
        request.setAttribute("candidateList", candidates);
        request.getRequestDispatcher("recruitment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        
        candidateDAO.updateStatus(id, status);
        
        response.sendRedirect("recruitment");
    }
}