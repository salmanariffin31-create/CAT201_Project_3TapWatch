<%--
  Created by IntelliJ IDEA.
  User: Ammar
  Date: 10/01/2026
  Time: 01:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Edit Movie</h2>
<form action="admin" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${movie.id}">

    Title: <input type="text" name="title" value="${movie.title}"><br><br>
    Genre: <input type="text" name="genre" value="${movie.genre}"><br><br>
    Price: <input type="number" name="price" value="${movie.price}" step="0.01"><br><br>

    <button type="submit">Update Movie</button>
    <a href="admin">Cancel</a>
</form>
</body>
</html>