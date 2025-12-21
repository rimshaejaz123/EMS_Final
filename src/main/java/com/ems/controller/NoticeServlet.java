package com.ems.controller;

import com.ems.dao.NoticeDAO;
import com.ems.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/notices")
public class NoticeServlet extends HttpServlet {

    private NoticeDAO noticeDAO;

    public void init() {
        noticeDAO = new NoticeDAO();
    }

    // Display the Page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Map<String, String>> notices = noticeDAO.getAllNotices();
        request.setAttribute("noticeList", notices);
        request.getRequestDispatcher("notices.jsp").forward(request, response);
    }

    // Handle Form Submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        if(user != null) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String audience = request.getParameter("audience");
            
            noticeDAO.createNotice(title, content, audience, user.getUserId());
        }
        
        response.sendRedirect("notices"); // Reload the page to show new data
    }
}