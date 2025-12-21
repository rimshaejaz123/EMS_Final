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

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("login".equals(action)) {
            handleLogin(request, response);
        } else if ("signup".equals(action)) {
            handleSignup(request, response);
        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if(session != null) session.invalidate();
            response.sendRedirect("login.jsp");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        User user = userDAO.loginUser(email, pass);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRoleId());
            // Redirect based on role (1=HR, 2=Employee)
            if(user.getRoleId() == 1) {
                response.sendRedirect("dashboard-hr"); 
            } else {
                response.sendRedirect("dashboard-emp");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid Credentials");
        }
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fName = request.getParameter("first_name");
        String lName = request.getParameter("last_name");
        String fullName = fName + " " + lName;
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        // Defaulting to HR (1) or Employee (2) based on a hidden field or logic.
        // For this example, we will register everyone as EMPLOYEE (2) by default, 
        // unless they use the specific HR Signup form which might pass role_id=1.
        int roleId = 2; 

        User newUser = new User(fullName, email, pass, roleId);
        
        if (userDAO.registerUser(newUser)) {
            response.sendRedirect("login.jsp?msg=Registration Successful");
        } else {
            response.sendRedirect("signup.jsp?error=Registration Failed");
        }
    }
}