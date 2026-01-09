<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.tapwatch.model.Cart" %>
<%@ page import="com.tapwatch.model.CartItem" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart - 3TapWatch</title>
    <style>
        :root {
            --primary:#27ae60;
            --primary-dark:#229954;
            --danger:#e74c3c;
            --danger-dark:#c0392b;
            --info:#3498db;
            --info-dark:#2e86c1;
            --bg:#f6f7fb;
            --text:#111827;
            --muted:#6b7280;
            --card:#ffffff;
            --border:#e5e7eb;
            --shadow:0 10px 30px rgba(0,0,0,0.08);
            --radius:16px;
        }
        *{ box-sizing:border-box; }
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
            justify-content:space-between;
            align-items:center;
            gap:14px;
            padding:18px 0;
        }
        .brand{
            display:flex; gap:10px; align-items:center;
            font-size:22px; font-weight:900;
        }
        .brand span{font-size:26px;}
        .nav-links{ display:flex; gap:12px; align-items:center; }
        .nav-links a{
            text-decoration:none;
            font-weight:800;
            color:var(--text);
            padding:10px 14px;
            border-radius:12px;
        }
        .nav-links a:hover{ background:#f0f2f6; }
        .cart-badge{
            background:#111827;
            color:white;
            padding:4px 8px;
            border-radius:999px;
            font-size:12px;
            font-weight:900;
            margin-left:6px;
        }

        /* Layout */
        .container{
            width:min(1100px, 92%);
            margin:26px auto 60px;
            display:grid;
            grid-template-columns: 1fr 340px;
            gap:18px;
        }

        .card{
            background:var(--card);
            border:1px solid var(--border);
            border-radius:var(--radius);
            box-shadow:var(--shadow);
            overflow:hidden;
        }

        /* Table */
        table{ width:100%; border-collapse:collapse; }
        thead th{
            text-align:left;
            padding:14px 16px;
            background:#f8fafc;
            border-bottom:1px solid var(--border);
            font-size:13px;
            color:var(--muted);
            text-transform:uppercase;
            letter-spacing:0.04em;
        }
        tbody td{
            padding:14px 16px;
            border-bottom:1px solid var(--border);
            vertical-align:middle;
        }
        tbody tr:hover{ background:#fbfdff; }

        .title{ font-weight:900; }
        .price,.subtotal{ font-weight:900; }
        .subtotal{ color:#111827; }

        /* Qty row */
        .qty-row{
            display:flex; gap:10px; align-items:center;
        }
        .qty-row input{
            width:78px;
            padding:10px 10px;
            border:1px solid var(--border);
            border-radius:12px;
            outline:none;
            font-weight:800;
        }
        .qty-row input:focus{
            border-color:var(--info);
            box-shadow:0 0 0 3px rgba(52,152,219,0.15);
        }

        /* Buttons */
        .btn{
            border:none;
            border-radius:12px;
            padding:10px 14px;
            cursor:pointer;
            font-weight:900;
            font-size:14px;
            transition:0.15s ease;
        }
        .btn-info{ background:var(--info); color:white; }
        .btn-info:hover{ background:var(--info-dark); transform:translateY(-1px); }
        .btn-danger{ background:var(--danger); color:white; }
        .btn-danger:hover{ background:var(--danger-dark); transform:translateY(-1px); }
        .btn-primary{ background:var(--primary); color:white; }
        .btn-primary:hover{ background:var(--primary-dark); transform:translateY(-1px); }
        .btn-secondary{ background:#e5e7eb; color:#111827; }
        .btn-secondary:hover{ background:#d1d5db; transform:translateY(-1px); }
        a.btn-link{ text-decoration:none; display:inline-flex; justify-content:center; align-items:center; }

        /* Summary */
        .summary{ padding:18px; }
        .summary h3{ margin:0 0 14px 0; font-size:18px; font-weight:1000; }
        .row{ display:flex; justify-content:space-between; margin:10px 0; color:var(--muted); font-weight:800; }
        .row strong{ color:var(--text); }

        .total-box{
            margin-top:14px;
            padding:14px;
            border-radius:16px;
            background:linear-gradient(135deg, rgba(39,174,96,0.12), rgba(52,152,219,0.10));
            border:1px solid rgba(39,174,96,0.18);
        }
        .total-label{
            font-size:12px;
            text-transform:uppercase;
            letter-spacing:0.08em;
            font-weight:1000;
            color:var(--muted);
        }
        .total-value{
            margin-top:8px;
            font-size:28px;
            font-weight:1000;
            color:#e74c3c;
        }
        .actions{ display:grid; gap:10px; margin-top:16px; }

        /* Empty cart */
        .empty{
            grid-column:1 / -1;
            padding:54px 26px;
            text-align:center;
        }
        .empty .icon{ font-size:56px; }
        .empty h2{ margin:12px 0 6px 0; }
        .empty p{ margin:0 0 18px 0; color:var(--muted); font-weight:700; }

        @media (max-width:900px){
            .container{ grid-template-columns:1fr; }
        }
    </style>
</head>
<body>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    int itemCount = (cart != null) ? cart.getItemCount() : 0;
%>

<div class="navbar">
    <div class="nav-inner">
        <div class="brand"><span>🛒</span> Shopping Cart</div>
        <div class="nav-links">
            <a href="movies">← Back to Movies</a>
            <a href="cart">Cart <span class="cart-badge"><%= itemCount %></span></a>
        </div>
    </div>
</div>

<div class="container">
    <%
        if (cart == null || cart.isEmpty()) {
    %>

    <div class="card empty">
        <div class="icon">🛍️</div>
        <h2>Your cart is empty</h2>
        <p>Browse the movie catalog and add items to your cart.</p>
        <a href="movies" class="btn btn-primary btn-link" style="width:220px; margin:0 auto;">Continue Shopping</a>
    </div>

    <%
        } else {
            List<CartItem> items = cart.getItems();
    %>

    <div class="card">
        <table>
            <thead>
                <tr>
                    <th>Movie</th>
                    <th>Price (RM)</th>
                    <th>Quantity</th>
                    <th>Subtotal (RM)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% for (CartItem item : items) { %>
                <tr>
                    <td class="title"><%= item.getMovie().getTitle() %></td>
                    <td class="price"><%= String.format("%.2f", item.getMovie().getPrice()) %></td>
                    <td>
                        <form method="POST" action="cart" class="qty-row">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="movieId" value="<%= item.getMovie().getId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" max="10">
                            <button type="submit" class="btn btn-info">Update</button>
                        </form>
                    </td>
                    <td class="subtotal"><%= String.format("%.2f", item.getSubtotal()) %></td>
                    <td>
                        <form method="POST" action="cart" style="margin:0;">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="movieId" value="<%= item.getMovie().getId() %>">
                            <button type="submit" class="btn btn-danger">Remove</button>
                        </form>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="card summary">
        <h3>Order Summary</h3>

        <div class="row">
            <span>Total Items</span>
            <strong><%= cart.getItemCount() %></strong>
        </div>

        <div class="total-box">
            <div class="total-label">Total Amount</div>
            <div class="total-value">RM <%= String.format("%.2f", cart.getTotal()) %></div>
        </div>

        <div class="actions">
            <a href="movies" class="btn btn-secondary btn-link">Continue Shopping</a>
            <form method="POST" action="checkout" style="margin:0;">
                <button type="submit" class="btn btn-primary" style="width:100%;">Proceed to Checkout</button>
            </form>
        </div>
    </div>

    <%
        }
    %>
</div>

</body>
</html>
