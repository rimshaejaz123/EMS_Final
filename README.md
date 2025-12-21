Employees Management System (EMS) 🚀
Project Overview
The Employees Management System (EMS) is a full-stack Java-based web application designed to streamline and automate HR and employee management operations.
It provides a secure, role-based platform for managing employees, attendance, salaries, departments, and recruitment processes.

The system is built using Java (Jakarta EE), JSP, Servlets, and MySQL, following the MVC architecture to ensure scalability and maintainability.

🧩 System Modules
EMS is divided into two role-based modules:

🛡️ HR Admin (Manager) Module
The HR Admin has full control over organizational operations, including:

Dashboard – Real-time statistics and visual charts

Employee Management – Add, view, update, and delete employees

Department Management – Create and manage departments

Attendance Monitoring – Track organization-wide attendance

Leave Management – Approve or reject employee leave requests

Payroll Management – Manage salaries and payroll records

Salary Slips – Auto-generated digital salary slips

Notice Board – Publish company-wide announcements

Recruitment Pipeline – Track candidates (Applied → Interviewed → Selected)

ID Card Generation – Printable employee ID cards

👤 Employee (Staff) Module
Employees are provided with secure self-service access to:

Personal Dashboard – Individual stats and HR notices

My Attendance – View personal attendance records

Leave Application – Apply for leave and track status

My Salary – View salary history and download slips

My ID Card – View or print digital ID card

Company Notices – Read-only access to announcements

🔐 Role-Based Security
Authentication is handled via AuthServlet

The system automatically detects user roles

Users are redirected to their authorized dashboards

Prevents unauthorized access to sensitive features

🛠️ Technology Stack
Frontend
JSP, HTML5, CSS3

JavaScript

Chart.js

FontAwesome

Backend
Java (Jakarta EE)

Servlets

JDBC

DAO Pattern

MVC Architecture

Database
MySQL

phpMyAdmin (XAMPP/WAMP)

Tools & Server
Apache NetBeans

Maven

Git & GitHub

Apache Tomcat (v9+)

⚙️ Installation & Setup (Quick Guide)
Start Apache & MySQL using XAMPP/WAMP

Create database ems_db in phpMyAdmin

Import the provided SQL file

Clone the repository:

bash
Copy code
git clone https://github.com/your-username/Employee-Management-System.git
Open the project in NetBeans

Configure database credentials in DBConnection.java

Run the project on Apache Tomcat

🚀 Future Enhancements
Advanced analytics dashboard

Third-party integrations

Cloud deployment

Performance optimization

👩‍💻 Author
Rimsha Ejaz
Project Lead & Software Engineer

📧 Email: rimshaejaz3210@gmail.com
🔗 LinkedIn: Rimsha Ejaz

📄 License
This project is licensed under the MIT License.

⭐ Thank you for exploring the Employees Management System!
This project demonstrates how enterprise-level HR operations can be efficiently managed using modern Java web technologies.
