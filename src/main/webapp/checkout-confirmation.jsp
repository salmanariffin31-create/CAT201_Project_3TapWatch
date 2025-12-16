<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Order Confirmation - TapWatch</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .container { max-width: 600px; margin: 0 auto; background-color: white; padding: 40px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); text-align: center; }
        h1 { color: #27ae60; margin-bottom: 20px; }
        .confirmation-icon { font-size: 60px; margin: 20px 0; }
        .order-details { background-color: #ecf0f1; padding: 20px; border-radius: 5px; margin: 20px 0; text-align: left; }
        .order-details p { margin: 10px 0; font-size: 16px; }
        .order-details strong { color: #2c3e50; }
        .total { font-size: 28px; font-weight: bold; color: #e74c3c; margin: 10px 0; }
        .btn { padding: 12px 30px; background-color: #27ae60; color: white; text-decoration: none; border-radius: 4px; display: inline-block; margin-top: 20px; font-size: 16px; }
        .btn:hover { background-color: #229954; }
    </style>
</head>
<body>

<div class="container">
    <div class="confirmation-icon">✓</div>
    <h1>Order Confirmation</h1>
    <p>Thank you for your purchase! Your order has been successfully placed.</p>

    <div class="order-details">
        <p><strong>Order Date:</strong> <%= request.getAttribute("orderDate") %></p>
        <p><strong>Number of Items:</strong> <%= request.getAttribute("itemCount") %></p>
        <p class="total">Total Amount: RM <%= String.format("%.2f", (Double) request.getAttribute("orderTotal")) %></p>
    </div>

    <p style="color: #666; margin: 20px 0;">
        An order confirmation email will be sent to your registered email address shortly.
    </p>

    <a href="movies" class="btn">Continue Shopping</a>
</div>

</body>
</html>