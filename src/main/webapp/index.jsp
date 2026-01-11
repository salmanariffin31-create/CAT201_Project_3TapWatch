<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.tapwatch.model.Movie" %>
            <%@ page import="com.tapwatch.model.Cart" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <title>3TapWatch - Movie Catalog</title>
                    <link rel="stylesheet" href="css/style.css">
                </head>

                <body>

                    <div class="navbar">
                        <div class="nav-inner">
                            <a href="movies" class="brand"><span>🎬</span> 3TapWatch</a>
                            <div class="nav-links">
                                <a href="movies">Home</a>
                                <% Cart cart=(Cart) session.getAttribute("cart"); int itemCount=(cart !=null) ?
                                    cart.getItemCount() : 0; %>
                                    <a href="cart">🛒 Cart <span class="cart-badge">
                                            <%= itemCount %>
                                        </span></a>

                                    <% String username=(String) session.getAttribute("username"); if (username !=null) {
                                        %>
                                        <span style="font-weight:700; color:var(--primary);">Hi, <%= username %></span>
                                        <% if ("admin".equals(username)) { %>
                                            <a href="admin" style="color: var(--danger);">Admin Panel</a>
                                            <% } %>
                                                <a href="LogoutServlet">Logout</a>
                                                <% } else { %>
                                                    <a href="login.jsp" class="btn btn-primary">Login</a>
                                                    <% } %>
                            </div>
                        </div>
                    </div>

                    <div class="container">

                        <!-- Success Message -->
                        <% String message=(String) session.getAttribute("message"); if (message !=null) { %>
                            <div class="alert">
                                <%= message %>
                            </div>
                            <% session.removeAttribute("message"); } %>

                                <div class="grid">
                                    <% List<Movie> movies = (List<Movie>) request.getAttribute("movies");
                                            for (Movie m : movies) {
                                            %>
                                            <div class="card">
                                                <!-- Poster (if file not found, browser shows broken icon but still ok) -->
                                                <a href="details?id=<%= m.getId() %>" class="card-link">
                                                    <img class="poster" src="<%= m.getImagePath() %>"
                                                        alt="<%= m.getTitle() %>">
                                                </a>

                                                <div class="card-body">
                                                    <h3 class="title">
                                                        <a href="details?id=<%= m.getId() %>"
                                                            style="text-decoration: none; color: inherit;">
                                                            <%= m.getTitle() %>
                                                        </a>
                                                    </h3>
                                                    <div class="meta">
                                                        <span class="genre-pill">
                                                            <%= m.getGenre() %>
                                                        </span>
                                                    </div>
                                                    <p class="desc">
                                                        <%= m.getDescription() %>
                                                    </p>

                                                    <div class="bottom">
                                                        <p class="price">RM <%= String.format("%.2f", m.getPrice()) %>
                                                        </p>

                                                        <form method="POST" action="cart" class="form">
                                                            <input type="hidden" name="action" value="add">
                                                            <input type="hidden" name="movieId"
                                                                value="<%= m.getId() %>">
                                                            <input class="qty" type="number" name="quantity" value="1"
                                                                min="1" max="10">
                                                            <button class="btn btn-primary" type="submit">Add</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>
                                </div>

                    </div>
                </body>

                </html>