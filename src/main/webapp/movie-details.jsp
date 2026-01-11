<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.tapwatch.model.Movie" %>
        <%@ page import="com.tapwatch.model.Cart" %>
            <%@ page import="com.tapwatch.dao.OrderDAO" %>
                <%@ page import="com.tapwatch.model.Order" %>
                    <%@ page import="com.tapwatch.model.CartItem" %>
                        <%@ page import="java.util.List" %>
                            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                                <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                                    <!DOCTYPE html>
                                    <html lang="en">

                                    <head>
                                        <meta charset="UTF-8">
                                        <title>${movie.title} - 3TapWatch</title>
                                        <link rel="stylesheet" href="css/style.css">
                                        <link
                                            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap"
                                            rel="stylesheet">
                                    </head>

                                    <body>

                                        <!-- Navbar (Consistent with index.jsp) -->
                                        <div class="navbar">
                                            <div class="nav-inner">
                                                <a href="movies" class="brand"><span>🎬</span> 3TapWatch</a>
                                                <div class="nav-links">
                                                    <a href="movies">Home</a>
                                                    <a href="library">My Library</a>
                                                    <% Cart cart=(Cart) session.getAttribute("cart"); int
                                                        itemCount=(cart !=null) ? cart.getItemCount() : 0; %>
                                                        <a href="cart">🛒 Cart <span class="cart-badge">
                                                                <%= itemCount %>
                                                            </span></a>

                                                        <% String username=(String) session.getAttribute("username"); if
                                                            (username !=null) { %>
                                                            <span style="font-weight:700; color:var(--primary);">Hi, <%=
                                                                    username %></span>
                                                            <% if ("admin".equals(username)) { %>
                                                                <a href="admin" style="color: var(--danger);">Admin
                                                                    Panel</a>
                                                                <% } %>
                                                                    <a href="LogoutServlet">Logout</a>
                                                                    <% } else { %>
                                                                        <a href="login.jsp"
                                                                            class="btn btn-primary">Login</a>
                                                                        <% } %>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="container">
                                            <!-- Main Details Card -->
                                            <div class="card"
                                                style="display: flex; flex-direction: column; overflow: hidden;">

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
                                                        <h1
                                                            style="font-size: 36px; font-weight: 900; margin: 0 0 10px; line-height: 1.2;">
                                                            ${movie.title}
                                                        </h1>

                                                        <div class="meta"
                                                            style="font-size: 16px; margin-bottom: 24px; flex-wrap: wrap;">
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

                                                        <% Movie movie=(Movie) request.getAttribute("movie"); boolean
                                                            isOwned=false; String ownedType="" ; String
                                                            currentUsername=(String) session.getAttribute("username");
                                                            if (currentUsername !=null) { OrderDAO orderDao=new
                                                            OrderDAO(); List<Order> myOrders =
                                                            orderDao.getOrdersByUsername(currentUsername);
                                                            if (myOrders != null) {
                                                            for(Order o : myOrders) {
                                                            for(CartItem i : o.getItems()) {
                                                            if(i.getMovie().getId() == movie.getId()) {
                                                            isOwned = true;
                                                            ownedType = i.getType();
                                                            break;
                                                            }
                                                            }
                                                            if(isOwned) break;
                                                            }
                                                            }
                                                            }
                                                            %>

                                                            <% if (isOwned) { %>
                                                                <div
                                                                    style="margin-top: 20px; padding: 20px; background: #d4edda; color: #155724; border-radius: 8px; border: 1px solid #c3e6cb; text-align: center;">
                                                                    <h3 style="margin: 0; font-size: 18px;">
                                                                        <% if("rent".equals(ownedType)) { %>
                                                                            ✅ You have rented this movie
                                                                            <% } else { %>
                                                                                ✅ You own this movie
                                                                                <% } %>
                                                                    </h3>
                                                                </div>
                                                                <% } else { %>
                                                                    <div class="purchase-options"
                                                                        style="margin-top:20px; display:flex; gap:10px;">
                                                                        <form method="POST" action="cart"
                                                                            style="flex:1;">
                                                                            <input type="hidden" name="action"
                                                                                value="add">
                                                                            <input type="hidden" name="movieId"
                                                                                value="${movie.id}">
                                                                            <input type="hidden" name="quantity"
                                                                                value="1">
                                                                            <button type="submit" name="type"
                                                                                value="buy" class="btn btn-primary"
                                                                                style="width:100%; padding:15px; font-size:16px;">
                                                                                Buy for RM ${movie.price}
                                                                            </button>
                                                                        </form>

                                                                        <form method="POST" action="cart"
                                                                            style="flex:1;">
                                                                            <input type="hidden" name="action"
                                                                                value="add">
                                                                            <input type="hidden" name="movieId"
                                                                                value="${movie.id}">
                                                                            <input type="hidden" name="quantity"
                                                                                value="1">
                                                                            <button type="submit" name="type"
                                                                                value="rent" class="btn"
                                                                                style="width:100%; padding:15px; font-size:16px; background:#f39c12; color:white;">
                                                                                Rent for RM <%= String.format("%.2f",
                                                                                    movie.getRentPrice()) %>
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                                    <% } %>
                                                    </div>
                                                </div>

                                                <!-- Trailer Section -->
                                                <c:if test="${not empty movie.trailerUrl}">
                                                    <div
                                                        style="background: #f9f9f9; padding: 40px; border-top: 1px solid var(--border);">
                                                        <h3 style="margin-top: 0; margin-bottom: 20px;">Watch Trailer
                                                        </h3>
                                                        <div
                                                            style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; border-radius: 12px; box-shadow: var(--shadow);">
                                                            <iframe
                                                                style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
                                                                src="${movie.trailerUrl}" title="YouTube video player"
                                                                frameborder="0"
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