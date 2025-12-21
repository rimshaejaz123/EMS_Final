<%-- 
    Document   : add_employee
    Created on : 16 Dec 2025, 22:42:12
    Author     : Rimsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .form-container {
            max-width: 600px; margin: 40px auto; background: white; padding: 30px;
            border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #333; }
        .form-group input, .form-group select {
            width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box;
        }
        .btn-submit {
            background: #1976d2; color: white; border: none; padding: 12px 20px;
            width: 100%; border-radius: 4px; cursor: pointer; font-size: 16px;
        }
        .btn-submit:hover { background: #1565c0; }
    </style>
</head>
<body style="background-color: #f4f6f9;">

    <div class="form-container">
        <h2 style="text-align:center; margin-bottom:20px;">Add New Employee</h2>
        
        <div class="form-group">
    <label>Profile Photo</label>
    <input type="file" name="photo" accept="image/*">
            </div>
            <input type="hidden" name="action" value="add">
            
            <h4 style="color:#666; border-bottom:1px solid #eee; padding-bottom:10px; margin-bottom:15px;">Login Credentials</h4>
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" required placeholder="e.g. John Doe">
            </div>
            
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" required placeholder="e.g. john@company.com">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required placeholder="Set a temporary password">
            </div>

            <h4 style="color:#666; border-bottom:1px solid #eee; padding-bottom:10px; margin-bottom:15px; margin-top:20px;">Job Details</h4>

            <div class="form-group">
                <label>Department</label>
                <select name="dept_id" required>
                    <option value="" disabled selected>Select Department</option>
                    <option value="1">IT Department</option>
                    <option value="2">HR Department</option>
                    <option value="3">Administration</option>
                </select>
            </div>

            <div class="form-group">
                <label>Designation</label>
                <input type="text" name="designation" required placeholder="e.g. Software Engineer">
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="text" name="contact" required placeholder="e.g. 9876543210">
            </div>

            <div class="form-group">
                <label>Joining Date</label>
                <input type="date" name="join_date" required>
            </div>

            <button type="submit" class="btn-submit">Create Employee</button>
            <a href="employees" style="display:block; text-align:center; margin-top:15px; color:#666; text-decoration:none;">Cancel</a>
        </form>
    </div>

</body>
</html>