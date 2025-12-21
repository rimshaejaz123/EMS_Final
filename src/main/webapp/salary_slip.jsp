<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Salary Slip</title>
    <style>
        body { background: #555; display: flex; justify-content: center; padding: 20px; font-family: sans-serif; }
        .slip-container {
            background: white; width: 700px; padding: 40px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        .header { text-align: center; border-bottom: 2px solid #333; padding-bottom: 20px; margin-bottom: 20px; }
        .company-name { font-size: 24px; font-weight: bold; color: #1e3a8a; }
        .row { display: flex; justify-content: space-between; margin-bottom: 10px; }
        .label { font-weight: bold; color: #555; }
        
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background: #f4f4f4; }
        
        .total-row { background: #1e3a8a; color: white; font-weight: bold; }
        
        .print-btn {
            background: #1976d2; color: white; border: none; padding: 10px 20px;
            cursor: pointer; font-size: 16px; margin-top: 20px; display: block; width: 100%;
        }
        .print-btn:hover { background: #1565c0; }
        
        @media print {
            body { background: white; }
            .print-btn { display: none; }
            .slip-container { box-shadow: none; width: 100%; }
        }
    </style>
</head>
<body>

    <div class="slip-container">
        <div class="header">
            <div class="company-name">EMPLOYEE MANAGEMENT SYSTEM</div>
            <p>Salary Slip for the Month of <strong>${slip.month}</strong></p>
        </div>

        <div class="row">
            <div><span class="label">Employee Name:</span> ${slip.name}</div>
            <div><span class="label">Designation:</span> ${slip.designation}</div>
        </div>
        <div class="row">
            <div><span class="label">Department:</span> ${slip.dept}</div>
            <div><span class="label">Email:</span> ${slip.email}</div>
        </div>

        <table>
            <tr>
                <th>Earnings</th>
                <th>Amount</th>
                <th>Deductions</th>
                <th>Amount</th>
            </tr>
            <tr>
                <td>Basic Salary</td>
                <td>$${slip.basic}</td>
                <td>Tax & PF</td>
                <td>$${slip.deduction}</td>
            </tr>
            <tr>
                <td>Bonus / Incentives</td>
                <td>$${slip.bonus}</td>
                <td></td>
                <td></td>
            </tr>
            <tr class="total-row">
                <td>Total Earnings</td>
                <td></td>
                <td>NET PAYABLE</td>
                <td>$${slip.total}</td>
            </tr>
        </table>

        <p style="margin-top:40px; font-size:12px; text-align: center;">This is a computer-generated document. No signature is required.</p>

        <button onclick="window.print()" class="print-btn">Print / Save as PDF</button>
    </div>

</body>
</html>