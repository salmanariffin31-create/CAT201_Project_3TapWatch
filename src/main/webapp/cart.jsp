<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.tapwatch.model.Cart" %>
        <%@ page import="com.tapwatch.model.CartItem" %>
            <%@ page import="java.util.List" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <title>3TapWatch - Shopping Cart</title>
                    <link rel="stylesheet" href="css/style.css">
                    <style>
                        /* Cart Specific overwrites or additions if needed */
                        .badge-rent {
                            background-color: #f39c12 !important;
                        }

                        .badge-buy {
                            background-color: #3498db !important;
                        }

                        .container {
                            display: grid;
                            grid-template-columns: 1fr 340px;
                            gap: 18px;
                        }

                        table {
                            width: 100%;
                            border-collapse: collapse;
                        }

                        thead th {
                            text-align: left;
                            padding: 14px 16px;
                            background: #f8fafc;
                            border-bottom: 1px solid var(--border);
                            font-size: 13px;
                            color: var(--muted);
                            text-transform: uppercase;
                            letter-spacing: 0.04em;
                        }

                        tbody td {
                            padding: 14px 16px;
                            border-bottom: 1px solid var(--border);
                            vertical-align: middle;
                        }

                        tbody tr:hover {
                            background: #fbfdff;
                        }

                        .qty-row input:focus {
                            border-color: var(--info);
                            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.15);
                        }

                        .qty-row {
                            display: flex;
                            gap: 10px;
                            align-items: center;
                        }

                        .qty-row input {
                            width: 78px;
                            border-radius: var(--rounded);
                        }

                        .summary {
                            padding: 18px;
                        }

                        .summary h3 {
                            margin: 0 0 14px 0;
                            font-size: 18px;
                            font-weight: 1000;
                        }

                        .row {
                            display: flex;
                            justify-content: space-between;
                            margin: 10px 0;
                            color: var(--muted);
                            font-weight: 800;
                        }

                        .row strong {
                            color: var(--text);
                        }

                        .total-box {
                            margin-top: 14px;
                            padding: 14px;
                            border-radius: 16px;
                            background: linear-gradient(135deg, rgba(39, 174, 96, 0.12), rgba(52, 152, 219, 0.10));
                            border: 1px solid rgba(39, 174, 96, 0.18);
                        }

                        .total-label {
                            font-size: 12px;
                            text-transform: uppercase;
                            letter-spacing: 0.08em;
                            font-weight: 1000;
                            color: var(--muted);
                        }

                        .total-value {
                            margin-top: 8px;
                            font-size: 28px;
                            font-weight: 1000;
                            color: #e74c3c;
                        }

                        .actions {
                            display: grid;
                            gap: 10px;
                            margin-top: 16px;
                        }

                        .empty {
                            grid-column: 1 / -1;
                            padding: 54px 26px;
                            text-align: center;
                        }

                        .empty .icon {
                            font-size: 56px;
                        }

                        .empty h2 {
                            margin: 12px 0 6px 0;
                        }

                        .empty p {
                            margin: 0 0 18px 0;
                            color: var(--muted);
                            font-weight: 700;
                        }

                        @media (max-width:900px) {
                            .container {
                                grid-template-columns: 1fr;
                            }
                        }
                    </style>
                </head>

                <body>

                    <% Cart cart=(Cart) session.getAttribute("cart"); int itemCount=(cart !=null) ? cart.getItemCount()
                        : 0; %>

                        <div class="navbar">
                            <div class="nav-inner">
                                <a href="movies" class="brand"><span>🎬</span> 3TapWatch</a>
                                <div class="nav-links">
                                    <a href="movies">Home</a>
                                    <a href="library">My Library</a>
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
                            <% if (cart==null || cart.isEmpty()) { %>

                                <div class="card empty">
                                    <div class="icon">🛍️</div>
                                    <h2>Your cart is empty</h2>
                                    <p>Browse the movie catalog and add items to your cart.</p>
                                    <a href="movies" class="btn btn-primary btn-link"
                                        style="width:220px; margin:0 auto;">Continue Shopping</a>
                                </div>

                                <% } else { List<CartItem> items = cart.getItems();
                                    %>

                                    <div class="card">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Movie</th>
                                                    <th>Type</th>
                                                    <th>Price (RM)</th>
                                                    <th>Quantity</th>
                                                    <th>Subtotal (RM)</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (CartItem item : items) { String itemKey=item.getMovie().getId()
                                                    + "-" + item.getType(); double unitPrice="rent"
                                                    .equals(item.getType()) ? item.getMovie().getRentPrice() :
                                                    item.getMovie().getPrice(); String badgeClass="rent"
                                                    .equals(item.getType()) ? "badge-rent" : "badge-buy" ; %>
                                                    <tr>
                                                        <td class="title">
                                                            <%= item.getMovie().getTitle() %>
                                                        </td>
                                                        <td>
                                                            <span class="badge <%= badgeClass %>"
                                                                style="color: white; padding: 4px 8px; border-radius: 4px; font-size: 12px; text-transform: uppercase;">
                                                                <%= item.getType() %>
                                                            </span>
                                                        </td>
                                                        <td class="price">
                                                            <%= String.format("%.2f", unitPrice) %>
                                                        </td>
                                                        <td>
                                                            <form method="POST" action="cart" class="qty-row">
                                                                <input type="hidden" name="action" value="update">
                                                                <input type="hidden" name="itemKey"
                                                                    value="<%= itemKey %>">
                                                                <input type="number" name="quantity" class="qty"
                                                                    value="<%= item.getQuantity() %>" min="1" max="10"
                                                                    style="text-align: center; border-radius: 30px; border: 1px solid var(--border); padding: 8px; width: 80px;">
                                                                <button type="submit"
                                                                    class="btn btn-info">Update</button>
                                                            </form>
                                                        </td>
                                                        <td class="subtotal">
                                                            <%= String.format("%.2f", item.getSubtotal()) %>
                                                        </td>
                                                        <td>
                                                            <form method="POST" action="cart" style="margin:0;">
                                                                <input type="hidden" name="action" value="remove">
                                                                <input type="hidden" name="itemKey"
                                                                    value="<%= itemKey %>">
                                                                <button type="submit"
                                                                    class="btn btn-danger">Remove</button>
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
                                            <strong>
                                                <%= cart.getItemCount() %>
                                            </strong>
                                        </div>

                                        <div class="total-box">
                                            <div class="total-label">Total Amount</div>
                                            <div class="total-value">RM <%= String.format("%.2f", cart.getTotal()) %>
                                            </div>
                                        </div>

                                        <div class="actions">
                                            <a href="movies" class="btn btn-secondary btn-link">Continue Shopping</a>
                                            <form method="POST" action="checkout" style="margin:0;">
                                                <button type="submit" class="btn btn-primary"
                                                    style="width:100%;">Proceed to Checkout</button>
                                            </form>
                                        </div>
                                    </div>

                                    <% } %>
                        </div>

                </body>

                </html>