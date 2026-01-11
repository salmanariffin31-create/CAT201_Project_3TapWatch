<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.tapwatch.model.Movie" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <title>3TapWatch - Admin Panel</title>
                    <link rel="stylesheet" href="css/style.css">
                    <style>
                        .admin-container {
                            width: min(1100px, 92%);
                            margin: 40px auto;
                        }

                        .header-flex {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            margin-bottom: 20px;
                        }

                        table {
                            width: 100%;
                            border-collapse: collapse;
                            background: white;
                            border-radius: 12px;
                            overflow: hidden;
                            box-shadow: var(--shadow);
                        }

                        th {
                            background: #f8fafc;
                            text-align: left;
                            padding: 14px 18px;
                            font-weight: 800;
                            color: var(--muted);
                            border-bottom: 1px solid var(--border);
                        }

                        td {
                            padding: 14px 18px;
                            border-bottom: 1px solid var(--border);
                            vertical-align: middle;
                        }

                        tr:last-child td {
                            border-bottom: none;
                        }

                        .action-link {
                            font-weight: 700;
                            text-decoration: none;
                            margin-right: 10px;
                        }

                        .edit-link {
                            color: var(--info);
                        }

                        .delete-link {
                            color: #e74c3c;
                        }

                        .add-card {
                            background: white;
                            padding: 20px;
                            border-radius: 16px;
                            border: 1px solid var(--border);
                            box-shadow: var(--shadow);
                            margin-bottom: 30px;
                        }

                        .form-row {
                            display: flex;
                            gap: 10px;
                            align-items: flex-end;
                        }

                        .form-col {
                            flex: 1;
                        }

                        .form-col label {
                            display: block;
                            margin-bottom: 6px;
                            font-weight: 700;
                            font-size: 13px;
                            color: var(--muted);
                        }
                    </style>
                </head>

                <body>

                    <div class="navbar">
                        <div class="nav-inner">
                            <a href="movies" class="brand"><span>🎬</span> 3TapWatch Admin</a>
                            <div class="nav-links">
                                <a href="movies">Back to Home</a>
                                <a href="LogoutServlet">Logout</a>
                            </div>
                        </div>
                    </div>

                    <div class="admin-container">

                        <div class="add-card">
                            <h3>Add New Movie</h3>
                            <form action="admin" method="post" class="form-row">
                                <div class="form-col">
                                    <label>Title</label>
                                    <input type="text" name="title" class="form-input" required>
                                </div>
                                <div class="form-col">
                                    <label>Genre</label>
                                    <select name="genre" class="form-input" required>
                                        <option value="" disabled selected>Select Genre</option>
                                        <option value="Action">Action</option>
                                        <option value="Sci-Fi">Sci-Fi</option>
                                        <option value="Comedy">Comedy</option>
                                        <option value="Drama">Drama</option>
                                        <option value="Horror">Horror</option>
                                        <option value="Romance">Romance</option>
                                        <option value="Adventure">Adventure</option>
                                    </select>
                                </div>
                                <div class="form-col">
                                    <label>Poster URL</label>
                                    <input type="text" name="posterUrl" class="form-input"
                                        placeholder="images/custom.jpg">
                                </div>
                                <div class="form-col">
                                    <label>Price (RM)</label>
                                    <input type="number" name="price" class="form-input" step="0.01" required>
                                </div>
                                <div class="form-col" style="flex: 0 0 120px;">
                                    <button type="submit" class="btn btn-primary" style="width: 100%;">Add</button>
                                </div>
                            </form>
                        </div>

                        <div class="header-flex">
                            <h2>Manage Movies</h2>
                            <span class="badge">${movies.size()} Movies</span>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Genre</th>
                                    <th>Price</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="movie" items="${movies}">
                                    <tr>
                                        <td>#${movie.id}</td>
                                        <td><strong>${movie.title}</strong></td>
                                        <td><span class="genre-pill">${movie.genre}</span></td>
                                        <td style="color: #e74c3c; font-weight: 900;">RM ${movie.price}</td>
                                        <td>
                                            <a href="admin?action=edit&id=${movie.id}"
                                                class="action-link edit-link">Edit</a>
                                            <a href="admin?action=delete&id=${movie.id}" class="action-link delete-link"
                                                onclick="return confirm('Are you sure you want to delete this movie?')">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="header-flex" style="margin-top: 40px;">
                            <h2>Recent Orders</h2>
                            <span class="badge">${orders != null ? orders.size() : 0} Orders</span>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>User</th>
                                    <th>Date</th>
                                    <th>Items</th>
                                    <th>Total (RM)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty orders}">
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td style="font-family: monospace;">${order.orderId}</td>
                                                <td><strong>${order.username}</strong></td>
                                                <td>${order.orderDate}</td>
                                                <td>
                                                    <ul
                                                        style="margin: 0; padding-left: 15px; font-size: 13px; list-style-type: circle;">
                                                        <c:forEach var="item" items="${order.items}">
                                                            <li>
                                                                ${item.quantity}x ${item.movie.title}
                                                                <span
                                                                    style="color: var(--muted); text-transform: uppercase; font-size: 11px;">
                                                                    (${item.type})
                                                                </span>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </td>
                                                <td style="color: #27ae60; font-weight: 900;">RM ${String.format("%.2f",
                                                    order.total)}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="5"
                                                style="text-align: center; color: var(--muted); padding: 30px;">
                                                No orders placed yet.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>

                    </div>

                </body>

                </html>