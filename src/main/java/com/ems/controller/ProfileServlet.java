package com.ems.controller;

import com.ems.dao.UserDAO;
import com.ems.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    // GET: Show the Profile Page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    // POST: Handle Updates
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        if(user != null) {
            String action = request.getParameter("action");
            
            if ("updateInfo".equals(action)) {
                String name = request.getParameter("fullname");
                String email = request.getParameter("email");
                
                if(userDAO.updateProfile(user.getUserId(), name, email)) {
                    // Update Session Data immediately
                    user.setFullName(name);
                    user.setEmail(email);
                    request.setAttribute("msg", "Profile Updated Successfully!");
                }
            } 
            else if ("changePass".equals(action)) {
                String pass = request.getParameter("password");
                if(userDAO.changePassword(user.getUserId(), pass)) {
                    request.setAttribute("msg", "Password Changed Successfully!");
                }
            }
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}