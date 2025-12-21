package com.ems.controller;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import com.ems.dao.EmployeeDAO;
import com.ems.model.Employee; // Import the new Model
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/employees")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)

public class EmployeeServlet extends HttpServlet {

    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    // GET: List all employees
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // FIX: Changed from List<Map<String,String>> to List<Employee>
        List<Employee> employees = employeeDAO.getAllEmployees();
        
        request.setAttribute("empList", employees);
        request.getRequestDispatcher("employees.jsp").forward(request, response);
    }

    // POST: Handle Actions like Add and Delete
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            // 1. Retrieve Form Data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            // Parse Dept ID safely (assuming valid input from select dropdown)
            int deptId = Integer.parseInt(request.getParameter("dept_id"));
            
            String designation = request.getParameter("designation");
            String contact = request.getParameter("contact");
            String joinDate = request.getParameter("join_date");
            
            // 2. Create Employee Object
            Employee emp = new Employee();
            emp.setName(name);
            emp.setEmail(email);
            emp.setDesignation(designation);
            emp.setJoinDate(joinDate);
            // We reuse 'type' or just pass contact directly if we updated DAO, 
            // but for this example, the DAO handles the linking.
            
            // 3. Call DAO with Debugging
            boolean success = employeeDAO.addEmployee(emp, password, deptId);
            
            if(success) {
                System.out.println("DEBUG: Employee Added Successfully!"); // Check NetBeans Output for this
                response.sendRedirect("employees"); 
            } else {
                System.out.println("DEBUG: Failed to Add Employee."); // Check NetBeans Output for this
                response.sendRedirect("add_employee.jsp?error=true");
            }
            
        } else if ("delete".equals(action)) {
            // Existing delete logic (if you have it)
            // int id = Integer.parseInt(request.getParameter("id"));
            // employeeDAO.deleteEmployee(id);
            response.sendRedirect("employees");
        }
    }
}