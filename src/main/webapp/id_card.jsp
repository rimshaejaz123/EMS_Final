<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ID Card Generation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: #444;
            align-items: center;
            height: 100vh;
            font-family: 'Arial', sans-serif;
        }

        .id-card-container {
            width: 350px;
            height: 550px;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            text-align: center;
            position: relative;
        }

        /* Blue Top Section */
        .card-header {
            background: #1976d2;
            height: 140px;
            flex-direction: column;
            color: white;
        }

        .company-name {
            font-size: 20px;
            font-weight: bold;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        /* Profile Image Circle */
        .profile-img-box {
            width: 120px;
            height: 120px;
            background: white;
            border-radius: 50%;
            border: 5px solid white;
            margin: -60px auto 10px; /* Pulls it up into the blue section */
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .profile-img-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* User Info */
        .name {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-top: 10px;
        }

        .designation {
            color: #1976d2;
            font-weight: bold;
            font-size: 14px;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .details {
            padding: 0 30px;
            text-align: left;
            font-size: 13px;
            color: #555;
            line-height: 24px;
        }
        
        .details strong { color: #333; }

        /* Fake Barcode at bottom */
        .barcode {
            margin-top: 30px;
            font-family: 'Courier New', monospace;
            font-weight: bold;
            letter-spacing: 5px;
            font-size: 18px;
            opacity: 0.7;
        }

        /* Print Button */
        .print-btn {
            position: fixed;
            bottom: 20px;
            background: white;
            color: black;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        @media print {
            body { background: white; }
            .print-btn { display: none; }
        }
    </style>
</head>
<body>

    <div class="id-card-container">
        <div class="card-header">
            <div class="company-name">EMS CORP</div>
            <div style="font-size:10px;">Employee Identity Card</div>
        </div>

        <div class="profile-img-box">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Profile">
        </div>

        <div class="name">${emp.name}</div>
        <div class="designation">${emp.designation}</div>

        <div class="details">
            <p><strong>ID No:</strong> ${emp.code}</p>
            <p><strong>Dept:</strong> ${emp.dept}</p>
            <p><strong>Phone:</strong> ${emp.phone}</p>
            <p><strong>Email:</strong> ${emp.email}</p>
            <p><strong>Joined:</strong> ${emp.joined}</p>
        </div>

        <div class="barcode">||| |||| || |||</div>
        <div style="font-size:10px; margin-top:5px;">${emp.code}</div>
    </div>

    <button class="print-btn" onclick="window.print()">Print ID Card</button>

</body>
</html>