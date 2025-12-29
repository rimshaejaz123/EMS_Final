<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up - EMS</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container" style="width: 1000px;">
        <div class="img-box">
            <img src="images/signup_image.png" alt="Signup Illustration">
        </div>
        <div class="form-box">
            <h2>SIGN UP</h2>

            <form action="auth" method="POST">
                <input type="hidden" name="action" value="signup">

                <div style="display: flex; gap: 10px;">
                    <div class="input-group">
                        <label>First Name</label>
                        <input type="text" name="first_name" required>
                    </div>
                    <div class="input-group">
                        <label>Last Name</label>
                        <input type="text" name="last_name" required>
                    </div>
                </div>

                <div class="input-group">
                    <label>Email</label>
                    <input type="email" name="email" required>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="password" required>
                </div>

                <button type="submit" class="btn" style="background:#8e44ad;">Sign Up</button>
            </form>
            
            <div class="links">
                Already have an Account? <a href="login.jsp" class="btn" style="background: #4a148c; padding: 5px 10px; width: auto; display:inline-block;">Sign In</a>
            </div>
        </div>
    </div>
</body>
</html>