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
                                <a href="library">My Library</a>
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

                                <!-- Search and Filter Section -->
                                <div style="margin-bottom: 30px;">
                                    <form action="movies" method="get"
                                        style="display: flex; gap: 12px; flex-wrap: wrap; align-items: center;">
                                        <input type="text" name="search" placeholder="Search by title..."
                                            style="flex: 1; padding: 14px 20px; border: none; border-radius: 50px; font-size: 16px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); outline: none;">

                                        <select name="genre"
                                            style="padding: 14px 20px; border: none; border-radius: 50px; font-size: 16px; min-width: 160px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); cursor: pointer; outline: none; background-color: white;">
                                            <option value="">All Genres</option>
                                            <option value="Action">Action</option>
                                            <option value="Sci-Fi">Sci-Fi</option>
                                            <option value="Drama">Drama</option>
                                            <option value="Comedy">Comedy</option>
                                            <option value="Horror">Horror</option>
                                            <option value="Romance">Romance</option>
                                            <option value="Adventure">Adventure</option>
                                            <option value="Crime">Crime</option>
                                            <option value="Animation">Animation</option>
                                            <option value="Mystery">Mystery</option>
                                            <option value="Biography">Biography</option>
                                        </select>

                                        <button type="submit" class="btn btn-primary"
                                            style="padding: 14px 32px; border-radius: 50px; font-weight: 700; box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);">Search</button>
                                        <a href="movies" class="btn btn-secondary"
                                            style="padding: 14px 24px; text-decoration: none; border-radius: 50px; background: #e0e6ed; color: #555;">Clear</a>
                                    </form>
                                </div>

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

                                                        <a href="details?id=<%= m.getId() %>" class="btn btn-primary"
                                                            style="width: 100%; text-align: center; display: block; text-decoration: none; padding: 10px 0;">
                                                            View Details
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>
                                </div>

                    </div>
                </body>

                </html>