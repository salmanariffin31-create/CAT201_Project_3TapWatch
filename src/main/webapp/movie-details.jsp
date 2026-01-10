<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>${movie.title} - 3TapWatch</title>
            <link rel="stylesheet" href="css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="navbar">
                <a href="index.jsp" class="logo">3TAPWATCH</a>
                <div class="nav-links">
                    <c:if test="${sessionScope.user != null}">
                        <a href="cart.jsp">Cart</a>
                        <a href="logout">Logout</a>
                    </c:if>
                    <c:if test="${sessionScope.user == null}">
                        <a href="login.jsp" class="btn-login">Sign In</a>
                    </c:if>
                </div>
            </div>

            <div class="container">
                <div class="details-container">
                    <div class="details-poster">
                        <img src="images/posters/${movie.posterUrl}" alt="${movie.title}"
                            onerror="this.src='https://placehold.co/300x450?text=No+Poster'">
                    </div>
                    <div class="details-info">
                        <h1>${movie.title}</h1>
                        <div class="meta-tags">
                            <span class="tag">${movie.year}</span>
                            <span class="tag">${movie.duration} min</span>
                            <span class="tag">${movie.genre}</span>
                            <span class="rating">★ ${movie.rating}</span>
                        </div>

                        <p class="description">
                            ${movie.description}
                        </p>

                        <div class="price-tag">
                            Price: RM ${movie.price}
                        </div>

                        <form action="cart" method="post" style="margin-top: 20px; display: flex; gap: 15px;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="movieId" value="${movie.id}">

                            <!-- Rent Button (RM 3 cheaper) -->
                            <button type="submit" name="type" value="Rent" class="btn-primary-large"
                                style="background-color: #e50914;">
                                Rent RM <span id="rentPrice">
                                    <script>document.write((${ movie.price } - 3).toFixed(2))</script>
                                </span>
                            </button>

                            <!-- Download Button (Full Price) -->
                            <button type="submit" name="type" value="Buy" class="btn-primary-large"
                                style="background-color: #46d369; color: #000;">
                                Download RM ${movie.price}
                            </button>
                            <a href="index.jsp" class="btn-secondary" style="margin-left:auto;">Back</a>
                        </form>

                        <c:if test="${not empty movie.trailerUrl}">
                            <div class="trailer-section">
                                <h3>Trailer</h3>
                                <iframe width="100%" height="315" src="${movie.trailerUrl}" title="YouTube video player"
                                    frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen></iframe>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </body>

        </html>