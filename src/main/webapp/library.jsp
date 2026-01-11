<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.tapwatch.model.CartItem" %>
            <%@ page import="com.tapwatch.model.Cart" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <title>My Library - 3TapWatch</title>
                        <link rel="stylesheet" href="css/style.css">
                        <style>
                            .badge-rent {
                                background: #f39c12;
                                color: white;
                                padding: 4px 8px;
                                border-radius: 4px;
                                font-size: 12px;
                                font-weight: bold;
                                text-transform: uppercase;
                            }

                            .badge-buy {
                                background: #27ae60;
                                color: white;
                                padding: 4px 8px;
                                border-radius: 4px;
                                font-size: 12px;
                                font-weight: bold;
                                text-transform: uppercase;
                            }
                        </style>
                    </head>

                    <body>

                        <div class="navbar">
                            <div class="nav-inner">
                                <a href="movies" class="brand"><span>🎬</span> 3TapWatch</a>
                                <div class="nav-links">
                                    <a href="movies">Home</a>
                                    <a href="library" class="active">My Library</a>

                                    <% Cart cart=(Cart) session.getAttribute("cart"); int itemCount=(cart !=null) ?
                                        cart.getItemCount() : 0; %>
                                        <a href="cart">🛒 Cart <span class="cart-badge">
                                                <%= itemCount %>
                                            </span></a>

                                        <% String username=(String) session.getAttribute("username"); %>
                                            <span style="font-weight:700; color:var(--primary);">Hi, <%= username %>
                                            </span>
                                            <% if ("admin".equals(username)) { %>
                                                <a href="admin" style="color: var(--danger);">Admin Panel</a>
                                                <% } %>
                                                    <a href="LogoutServlet">Logout</a>
                                </div>
                            </div>
                        </div>

                        <div class="container">
                            <h2 style="margin-bottom: 30px;">My Library</h2>

                            <% List<CartItem> items = (List<CartItem>) request.getAttribute("libraryItems"); %>

                                    <% if (items==null || items.isEmpty()) { %>
                                        <div class="card empty" style="text-align: center; padding: 50px;">
                                            <div style="font-size: 50px; margin-bottom: 20px;">📺</div>
                                            <h3>Your library is empty</h3>
                                            <p style="color: var(--muted);">Movies you rent or buy will appear here.</p>
                                            <a href="movies" class="btn btn-primary">Browse Movies</a>
                                        </div>
                                        <% } else { %>
                                            <div class="grid">
                                                <% for (CartItem item : items) { %>
                                                    <div class="card">
                                                        <a href="details?id=<%= item.getMovie().getId() %>">
                                                            <img class="poster"
                                                                src="<%= item.getMovie().getImagePath() %>"
                                                                alt="<%= item.getMovie().getTitle() %>">
                                                        </a>
                                                        <div class="card-body">
                                                            <h3 class="title">
                                                                <%= item.getMovie().getTitle() %>
                                                            </h3>
                                                            <div style="margin-bottom: 12px;">
                                                                <% if ("rent".equals(item.getType())) { %>
                                                                    <span class="badge-rent">Rented</span>
                                                                    <span
                                                                        style="font-size: 12px; color: var(--muted); margin-left: 6px;">Expires
                                                                        in 48h</span>
                                                                    <% } else { %>
                                                                        <span class="badge-buy">Purchased</span>
                                                                        <% } %>
                                                            </div>
                                                            <a href="details?id=<%= item.getMovie().getId() %>"
                                                                class="btn btn-primary"
                                                                style="width: 100%; display: block; text-align: center; text-decoration: none;">View
                                                                Details</a>
                                                        </div>
                                                    </div>
                                                    <% } %>
                                            </div>
                                            <% } %>
                        </div>

                    </body>

                    </html>