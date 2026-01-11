<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ page import="com.tapwatch.model.Cart" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>${movie.title} - 3TapWatch</title>
                    <link rel="stylesheet" href="css/style.css">
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap"
                        rel="stylesheet">
                </head>

                <body>

                    <!-- Navbar (Consistent with index.jsp) -->
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
                        <!-- Main Details Card -->
                        <div class="card" style="display: flex; flex-direction: column; overflow: hidden;">

                            <div style="display: flex; flex-wrap: wrap; gap: 40px; padding: 40px;">
                                <!-- Left Column: Poster -->
                                <div style="flex: 0 0 300px;">
                                    <img src="${movie.posterUrl}" class="poster"
                                        style="height: auto; aspect-ratio: 2/3; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"
                                        alt="${movie.title}"
                                        onerror="this.src='https://placehold.co/300x450?text=No+Poster'">
                                </div>

                                <!-- Right Column: Info -->
                                <div style="flex: 1; min-width: 300px;">
                                    <h1 style="font-size: 36px; font-weight: 900; margin: 0 0 10px; line-height: 1.2;">
                                        ${movie.title}
                                    </h1>

                                    <div class="meta" style="font-size: 16px; margin-bottom: 24px; flex-wrap: wrap;">
                                        <span class="genre-pill"
                                            style="font-size: 14px; padding: 4px 12px;">${movie.genre}</span>
                                        <span>${movie.year}</span> •
                                        <span>${movie.duration} min</span> •
                                        <span style="color: #f1c40f;">★ ${movie.rating}</span>
                                    </div>

                                    <p class="desc"
                                        style="font-size: 16px; line-height: 1.6; margin-bottom: 30px; max-width: 600px;">
                                        ${movie.description}
                                    </p>

                                    <h2 class="price" style="font-size: 32px; margin-bottom: 24px;">RM ${movie.price}
                                    </h2>

                                    <form action="cart" method="post"
                                        style="display: flex; gap: 16px; flex-wrap: wrap;">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="movieId" value="${movie.id}">
                                        <input type="hidden" name="quantity" value="1">

                                        <!-- Add to Cart Button -->
                                        <button type="submit" class="btn btn-primary"
                                            style="padding: 14px 24px; font-size: 16px; display: flex; align-items: center; gap: 8px;">
                                            <span>Add to Cart RM ${movie.price}</span>
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <!-- Trailer Section -->
                            <c:if test="${not empty movie.trailerUrl}">
                                <div style="background: #f9f9f9; padding: 40px; border-top: 1px solid var(--border);">
                                    <h3 style="margin-top: 0; margin-bottom: 20px;">Watch Trailer</h3>
                                    <div
                                        style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; border-radius: 12px; box-shadow: var(--shadow);">
                                        <iframe style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
                                            src="${movie.trailerUrl}" title="YouTube video player" frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                            allowfullscreen>
                                        </iframe>
                                    </div>
                                </div>
                            </c:if>

                        </div>

                        <div style="margin-top: 20px;">
                            <a href="movies" class="btn btn-secondary">← Back to Movies</a>
                        </div>
                    </div>

                </body>

                </html>