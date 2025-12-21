Employees Management System (EMS)
🚀 Project Overview
The Employees Management System (EMS) is a professional-grade, full-stack enterprise web application designed to centralize and automate core human resource operations.
Developed using a robust Java backend and a meticulously designed frontend utilizing HTML and CSS,the system offers a cinematic and highly stable user experience.
Database management and administration are handled through phpMyAdmin, ensuring efficient data persistence and relational integrity via a MySQL backend

Screenshots
EMS Entry Page :


EMS HR Sign Up :


EMS HR Login :


EMS HR Dashboard :


EMS HR Employees Page :


EMS HR Departments Page :


EMS HR Departments Data :


🌟 Key Features
1. Role-Based Access Control (RBAC)
Employee Role: Employees can access personalized dashboards to view their attendance, salaries, notices, and other relevant details.

HR Role: HR professionals can manage employees, approve leaves, issue notices, and oversee recruitment with advanced controls.

2. User Authentication & Authorization
Secure login system using JWT-based authentication.

Role-based permissions ensure sensitive data and functionalities are accessed only by authorized users.

3. Attendance Management
Real-time tracking of employee attendance with detailed records.

Customizable attendance reports for HR and management review.

4. Leave Management
Employees can easily apply for leaves via their dashboard.

HRs can view, approve, or reject leave requests with appropriate justifications.

5. Salary Management
Employees can access detailed breakdowns of their salaries.

HRs can manage and generate payroll efficiently.

6. Dynamic Notifications System
Employees receive real-time notifications for company updates, salary releases, and approvals.

Custom notices can be created and sent by HR.

Employees and HRs can view and manage the corporate calendar efficiently.

8. Employee & Department Management
HRs can manage departments, add or remove employees, and assign roles dynamically.

Detailed records of employee profiles and departmental insights.

9. Recruitment & Interview Insights
HRs can track recruitment progress and manage candidate pipelines.

Insights into interview outcomes and potential hires.

💡 Problem Solved
The EMS addresses key challenges faced by small to medium-sized organizations, such as:

Inefficient Employee Management: By automating attendance, leave, and salary management.

Communication Gaps: Through dynamic notifications and a centralized corporate calendar.

Security Concerns: By implementing robust RBAC and secure authentication systems.

Recruitment Bottlenecks: By providing streamlined tools for HRs to manage recruitment workflows.

🔧 Tech Stack
Frontend
JSP (JavaServer Pages): Dynamic web page rendering.

HTML5 & CSS3: Custom "Nebula Glass" dark theme architecture.

JavaScript: Interactivity and chart rendering.

Chart.js: Real-time data visualization for salary and department distribution.

FontAwesome: High-quality icons for the dashboard UI.

Backend
Java (Jakarta EE): Core business logic.

Servlets: Handling HTTP requests and controller logic (MVC Pattern).

JDBC: Secure database connectivity.

DAO Pattern: Data Access Objects for clean database operations.

Database
MySQL: Relational database management.

phpMyAdmin: GUI tool for managing the database (via XAMPP/WAMP).

DevOps & Tools
IDE: Apache NetBeans.

Build Tool: Maven (Project dependencies managed via pom.xml).

Version Control: Git & GitHub.

CI/CD: Jenkins (Automated build and deployment pipeline).

Server: Apache Tomcat (v9.0+)

📦 Installation & Setup
1. Database Setup (phpMyAdmin)
Start Apache and MySQL in your XAMPP/WAMP control panel.

Open your browser and go to http://localhost/phpmyadmin.

Click New and create a database named ems_db (or the name used in your SQL file).

Click Import, select the database.sql file provided in the project folder, and click Go to create the tables.

2. Clone & Open Project
Clone the repository:

Bash

git clone https://github.com/your-username/Employee-Management-System.git
Open NetBeans IDE.

Go to File > Open Project and navigate to the cloned folder EmployeeManagementSystem1.

3. Configure Database Connection
In NetBeans, expand the project folder tree to:

Source Packages > com.ems.util

Open DBConnection.java.

Update the connection parameters to match your local phpMyAdmin credentials:

Java

// Update these lines inside DBConnection.java
private static final String URL = "jdbc:mysql://localhost:3306/ems_db";
private static final String USERNAME = "root"; // Default XAMPP username
private static final String PASSWORD = "";     // Default XAMPP password is empty
4. Server Configuration
Right-click the project in NetBeans and select Properties.

Go to the Run category.

Ensure the Server is set to Apache Tomcat.

Click OK.

5. Run the Application
Right-click the project EmployeeManagementSystem1 in the "Projects" sidebar.

Select Clean and Build (this uses Maven to download dependencies from pom.xml).

Click Run (green play button).

The application will deploy to Tomcat and automatically open in your browser at: http://localhost:8080/EmployeeManagementSystem

🚀 Future Enhancements
Analytics Dashboard: Advanced analytics for HR and management.

Third-Party Integrations: Integration with tools like Slack and Zoom.

🙌 Contributing
We welcome contributions to enhance the EMS! Feel free to fork the repository and submit pull requests.

Roadmap
Phase 1: Implement core employee features (Dashboard, Attendance, Salary Information).

Phase 2: Develop HR functionalities (Employee Management, Leave Approvals).

Phase 3: Add advanced features like Recruitment and Interview Insights.

Phase 4: Optimize for scalability and deploy a production-ready version.

🧑‍💻 Authors & Acknowledgments
Rimsha Ejaz: Project Lead and Software Engineer

Special Thanks: To all contributors and testers who made this project possible.

📄 License
This project is licensed under the MIT License.

📬 Contact
For any questions or support, feel free to reach out:

Email: rimshaejaz3210@gmail.com

LinkedIn: RIMSHA Ejaz

Thank you for visiting the Employees Management System (EMS) project! We hope it provides valuable insights into how technology can simplify employee management
