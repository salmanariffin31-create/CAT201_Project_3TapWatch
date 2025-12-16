<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.tapwatch.model.Cart" %>
<%@ page import="com.tapwatch.model.CartItem" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Shopping Cart - TapWatch</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .navbar { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #333; padding: 10px 0; }
        .navbar a { margin: 0 15px; text-decoration: none; color: #0066cc; }
        .navbar a:hover { text-decoration: underline; }
        .container { max-width: 900px; margin: 0 auto; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        table th, table td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        table th { background-color: #f5f5f5; font-weight: bold; }
        table td input { width: 60px; padding: 5px; }
        .remove-btn { background-color: #e74c3c; color: white; padding: 5px 10px; border: none; border-radius: 3px; cursor: pointer; }
        .remove-btn:hover { background-color: #c0392b; }
        .summary { text-align: right; margin: 20px 0; padding: 15px; background-color: #ecf0f1; border-radius: 5px; }
        .summary h3 { margin: 10px 0; }
        .total { font-size: 24px; font-weight: bold; color: #e74c3c; }
        .buttons { display: flex; justify-content: flex-end; gap: 10px; margin: 20px 0; }
        .btn { padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
        .btn-primary { background-color: #27ae60; color: white; }
        .btn-primary:hover { background-color: #229954; }
        .btn-secondary { background-color: #95a5a6; color: white; }
        .btn-secondary:hover { background-color: #7f8c8d; }
        .empty-message { text-align: center; padding: 40px; color: #666; }
    </style>
</head>
<body>

<div class="navbar">
    <h1>🛒 Shopping Cart</h1>
    <div>
        <a href="movies">← Back to Movies</a>
    </div>
</div>

<div class="container">
    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <div class="empty-message">
            <h2>Your cart is empty</h2>
            <p><a href="movies">Continue Shopping</a></p>
        </div>
    <%
        } else {
            List<CartItem> items = cart.getItems();
    %>
        <table>
            <thead>
                <tr>
                    <th>Movie Title</th>
                    <th>Price (RM)</th>
                    <th>Quantity</th>
                    <th>Subtotal (RM)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (CartItem item : items) { %>
                <tr>
                    <td><%= item.getMovie().getTitle() %></td>
                    <td><%= String.format("%.2f", item.getMovie().getPrice()) %></td>
                    <td>
                        <form method="POST" action="cart" style="display: inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="movieId" value="<%= item.getMovie().getId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" max="10">
                            <button type="submit" style="padding: 4px 8px; background-color: #3498db; color: white; border: none; border-radius: 3px; cursor: pointer;">Update</button>
                        </form>
                    </td>
                    <td><%= String.format("%.2f", item.getSubtotal()) %></td>
                    <td>
                        <form method="POST" action="cart" style="display: inline;">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="movieId" value="<%= item.getMovie().getId() %>">
                            <button type="submit" class="remove-btn">Remove</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="summary">
            <h3>Order Summary</h3>
            <p>Total Items: <strong><%= cart.getItemCount() %></strong></p>
            <p class="total">Total: RM <%= String.format("%.2f", cart.getTotal()) %></p>
        </div>

        <div class="buttons">
            <a href="movies" class="btn btn-secondary">Continue Shopping</a>
            <form method="POST" action="checkout" style="display: inline;">
                <button type="submit" class="btn btn-primary">Proceed to Checkout</button>
            </form>
        </div>
    <% } %>
</div>

</body>
</html>