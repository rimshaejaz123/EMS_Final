

## **Project Overview**
The **Employees Management System (EMS)** is a **full-stack Java-based web application** designed to streamline and automate **HR and employee management operations**.  
It provides a **secure, role-based platform** for managing employees, attendance, salaries, departments, and recruitment processes.

---

## **System Modules**
EMS is divided into **two role-based modules**:

### **HR Admin (Manager) Module**
The HR Admin has full control over organizational operations, including:

- **Dashboard** – Real-time statistics and visual charts  
- **Employee Management** – Add, view, update, and delete employees  
- **Department Management** – Create and manage departments  
- **Attendance Monitoring** – Track organization-wide attendance  
- **Leave Management** – Approve or reject employee leave requests  
- **Payroll Management** – Manage salaries and payroll records  
- **Salary Slips** – Auto-generated digital salary slips  
- **Notice Board** – Publish company-wide announcements  
- **Recruitment Pipeline** – Track candidates (Applied → Interviewed → Selected)  
- **ID Card Generation** – Printable employee ID cards  

---

### **Employee (Staff) Module**
Employees are provided with secure self-service access to:

- **Personal Dashboard** – Individual stats and HR notices  
- **My Attendance** – View personal attendance records  
- **Leave Application** – Apply for leave and track status  
- **My Salary** – View salary history and download slips  
- **My ID Card** – View or print digital ID card  
- **Company Notices** – Read-only access to announcements  

---
The Landing
<img width="725" height="525" alt="image" src="https://github.com/user-attachments/assets/b5832f1a-408f-429f-9e75-592dea1b70b9" />

login page:
<img width="897" height="430" alt="image" src="https://github.com/user-attachments/assets/ec5ead6a-3830-4eef-a6d9-6a9c7a99ced9" />

Admin Dashboard:
<img width="1362" height="609" alt="image" src="https://github.com/user-attachments/assets/da26e9df-854d-4138-8ac6-48a0d4b17c5e" />

Employee Management Table
<img width="1366" height="609" alt="image" src="https://github.com/user-attachments/assets/1435b613-2ed4-4104-8fd7-05daa69a68b3" />

Recruitment Pipeline
<img width="1362" height="607" alt="image" src="https://github.com/user-attachments/assets/5cc8ffc1-5aba-4e71-be84-065028e8b44c" />

Generated ID Card
<img width="525" height="608" alt="image" src="https://github.com/user-attachments/assets/a4c48a6a-4f82-49c5-93ed-5da99efdc164" />

Salary Slip Generation
<img width="782" height="536" alt="image" src="https://github.com/user-attachments/assets/3099e7dd-ccd5-4f37-8510-7e9ae80f7f2d" />

Employee Dashboard
<img width="1366" height="606" alt="image" src="https://github.com/user-attachments/assets/e542fa35-db15-41ff-8a8c-01cdd921290c" />


## **Role-Based Security**
- Authentication handled via **AuthServlet**
- Automatic role detection and dashboard redirection
- Unauthorized access is restricted

---

## **Technology Stack**

### **Frontend**
- JSP, HTML5, CSS3
- JavaScript
- Chart.js
- FontAwesome

### **Backend**
- Java (Jakarta EE)
- Servlets
- JDBC
- DAO Pattern
- MVC Architecture

### **Database**
- MySQL
- phpMyAdmin

---

## **Installation & Setup**
1. Start Apache & MySQL (XAMPP/WAMP)  
2. Create database **ems_db**  
3. Import SQL file  
4. Clone repository:
   ```bash
   git clone https://github.com/your-username/Employee-Management-System.git

## **Author**
Rimsha Ejaz

📧 Email: rimshaejaz3210@gmail.com
🔗 LinkedIn: Rimsha Ejaz

## **License**
This project is licensed under the MIT License.
