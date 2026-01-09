<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tapwatch.model.Movie" %>
<%@ page import="com.tapwatch.model.Cart" %>

<!DOCTYPE html>
<html>
<head>
    <title>3TapWatch - Movie Catalog</title>
    <style>
        :root{
            --primary:#27ae60;
            --primary-dark:#229954;
            --info:#3498db;
            --bg:#f6f7fb;
            --text:#111827;
            --muted:#6b7280;
            --card:#ffffff;
            --border:#e5e7eb;
            --shadow:0 10px 30px rgba(0,0,0,0.08);
            --radius:16px;
        }
        *{box-sizing:border-box;}
        body{
            margin:0;
            font-family:Arial, sans-serif;
            background:var(--bg);
            color:var(--text);
        }

        /* Navbar */
        .navbar{
            position:sticky; top:0; z-index:20;
            background:rgba(255,255,255,0.95);
            backdrop-filter: blur(8px);
            border-bottom:1px solid var(--border);
        }
        .nav-inner{
            width:min(1100px, 92%);
            margin:0 auto;
            display:flex;
            align-items:center;
            justify-content:space-between;
            padding:18px 0;
        }
        .brand{
            display:flex; align-items:center; gap:10px;
            font-size:22px; font-weight:900;
        }
        .brand span{font-size:26px;}
        .nav-links{display:flex; gap:12px; align-items:center;}
        .nav-links a{
            text-decoration:none;
            font-weight:700;
            color:var(--text);
            padding:10px 14px;
            border-radius:12px;
        }
        .nav-links a:hover{background:#f0f2f6;}
        .cart-badge{
            background:#111827;
            color:white;
            padding:4px 8px;
            border-radius:999px;
            font-size:12px;
            font-weight:900;
            margin-left:6px;
        }

        /* Page container */
        .container{
            width:min(1100px, 92%);
            margin:26px auto 60px;
        }

        /* Message */
        .alert{
            background:#d4edda;
            border:1px solid rgba(39,174,96,0.25);
            color:#155724;
            padding:12px 14px;
            border-radius:14px;
            font-weight:800;
            margin:12px 0 18px;
            box-shadow:0 10px 18px rgba(0,0,0,0.05);
        }

        /* Grid cards */
        .grid{
            display:grid;
            grid-template-columns:repeat(auto-fill, minmax(260px, 1fr));
            gap:18px;
        }
        .card{
            background:var(--card);
            border:1px solid var(--border);
            border-radius:var(--radius);
            box-shadow:var(--shadow);
            overflow:hidden;
            transition:0.15s ease;
        }
        .card:hover{ transform:translateY(-4px); }
        .poster{
            width:100%;
            height:160px;
            object-fit:cover;
            background:#eaeaea;
        }
        .card-body{ padding:14px 14px 16px; }
        .title{ font-size:18px; font-weight:900; margin:0 0 6px; }
        .meta{
            display:flex; gap:8px; align-items:center;
            margin:0 0 10px;
            color:var(--muted);
            font-weight:700;
            font-size:13px;
        }
        .genre-pill{
            background:rgba(52,152,219,0.12);
            border:1px solid rgba(52,152,219,0.20);
            color:#1f5f91;
            padding:3px 8px;
            border-radius:999px;
            font-weight:900;
            font-size:12px;
        }
        .desc{ color:var(--muted); margin:0 0 12px; font-size:13px; line-height:1.35; }
        .bottom{
            display:flex;
            justify-content:space-between;
            align-items:center;
            gap:10px;
        }
        .price{
            font-size:18px;
            font-weight:1000;
            color:#e74c3c;
            margin:0;
        }
        .form{
            display:flex;
            gap:8px;
            align-items:center;
        }
        .qty{
            width:64px;
            padding:10px 10px;
            border:1px solid var(--border);
            border-radius:12px;
            outline:none;
            font-weight:800;
        }
        .qty:focus{
            border-color:var(--info);
            box-shadow:0 0 0 3px rgba(52,152,219,0.15);
        }
        .btn{
            border:none;
            border-radius:12px;
            padding:10px 14px;
            cursor:pointer;
            font-weight:900;
            transition:0.15s ease;
        }
        .btn-primary{ background:var(--primary); color:white; }
        .btn-primary:hover{ background:var(--primary-dark); transform:translateY(-1px); }

        @media (max-width:560px){
            .poster{ height:140px; }
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="nav-inner">
        <div class="brand"><span>🎬</span> 3TapWatch - Movie Catalog</div>
        <div class="nav-links">
            <a href="movies">Home</a>
            <%
                Cart cart = (Cart) session.getAttribute("cart");
                int itemCount = (cart != null) ? cart.getItemCount() : 0;
            %>
            <a href="cart">🛒 Cart <span class="cart-badge"><%= itemCount %></span></a>
        </div>
    </div>
</div>

<div class="container">

    <!-- Success Message -->
    <%
        String message = (String) session.getAttribute("message");
        if (message != null) {
    %>
        <div class="alert"><%= message %></div>
    <%
        session.removeAttribute("message");
        }
    %>

    <div class="grid">
        <%
            List<Movie> movies = (List<Movie>) request.getAttribute("movies");
            for (Movie m : movies) {
        %>
        <div class="card">
            <!-- Poster (if file not found, browser shows broken icon but still ok) -->
            <img class="poster" src="<%= m.getImagePath() %>" alt="<%= m.getTitle() %>">

            <div class="card-body">
                <h3 class="title"><%= m.getTitle() %></h3>
                <div class="meta">
                    <span class="genre-pill"><%= m.getGenre() %></span>
                </div>
                <p class="desc"><%= m.getDescription() %></p>

                <div class="bottom">
                    <p class="price">RM <%= String.format("%.2f", m.getPrice()) %></p>

                    <form method="POST" action="cart" class="form">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="movieId" value="<%= m.getId() %>">
                        <input class="qty" type="number" name="quantity" value="1" min="1" max="10">
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
