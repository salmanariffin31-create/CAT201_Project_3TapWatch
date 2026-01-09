<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>3TapWatch Admin</title>
    <style>
        table { border-collapse: collapse; width: 60%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .add-form { background: #f9f9f9; padding: 15px; border: 1px solid #ccc; width: 300px; }
    </style>
</head>
<body>
<h2>Movie Management (Admin: Ammar)</h2>

<div class="add-form">
    <h4>Add New Movie</h4>
    <form action="admin" method="post">
        <input type="text" name="title" placeholder="Movie Title" required><br><br>
        <input type="text" name="genre" placeholder="Genre" required><br><br>
        <input type="number" name="price" placeholder="Price" step="0.01" required><br><br>
        <button type="submit">Add Movie</button>
    </form>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Genre</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="movie" items="${movies}">
        <tr>
            <td>${movie.id}</td>
            <td>${movie.title}</td>
            <td>${movie.genre}</td>
            <td>RM ${movie.price}</td>
            <td>
                <a href="admin?action=edit&id=${movie.id}">Edit</a> |
                <a href="admin?action=delete&id=${movie.id}" onclick="return confirm('Delete this?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>