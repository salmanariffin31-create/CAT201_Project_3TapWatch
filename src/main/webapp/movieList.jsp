<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tapwatch.model.Movie" %>
<%@ page import="com.tapwatch.model.Cart" %>

<html>
<head>
    <title>TapWatch - Movie Catalog</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .navbar { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #333; padding: 10px 0; }
        .navbar a { margin: 0 15px; text-decoration: none; color: #0066cc; }
        .navbar a:hover { text-decoration: underline; }
        .movie-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; margin-top: 20px; }
        .movie-card { border: 1px solid #ddd; padding: 15px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .movie-card h3 { margin: 0 0 10px 0; }
        .movie-card p { margin: 5px 0; color: #666; }
        .price { font-size: 18px; font-weight: bold; color: #e74c3c; }
        .add-to-cart { margin-top: 10px; }
        .add-to-cart input { width: 60px; padding: 5px; }
        .add-to-cart button { padding: 8px 15px; background-color: #27ae60; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .add-to-cart button:hover { background-color: #229954; }

        .message-box {
            background: #d4edda;
            color: #155724;
            padding: 10px;
            border-radius: 5px;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1>TapWatch - Movie Catalog</h1>
    <div>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            int itemCount = (cart != null) ? cart.getItemCount() : 0;
        %>
        <a href="movies">Home</a>
        <a href="cart">🛒 Cart (<%= itemCount %>)</a>
    </div>
</div>


<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div class="message-box">
        <%= message %>
    </div>
<%
        session.removeAttribute("message"); // show once only
    }
%>

<div class="movie-grid">
    <%
        List<Movie> movies = (List<Movie>) request.getAttribute("movies");
        for (Movie m : movies) {
    %>
    <div class="movie-card">
        <h3><%= m.getTitle() %></h3>
        <p><strong>Genre:</strong> <%= m.getGenre() %></p>
        <p><%= m.getDescription() %></p>
        <p class="price">RM <%= String.format("%.2f", m.getPrice()) %></p>

        <form method="POST" action="cart" class="add-to-cart">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="movieId" value="<%= m.getId() %>">
            <input type="number" name="quantity" value="1" min="1" max="10">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
    <% } %>
</div>

</body>
</html>
