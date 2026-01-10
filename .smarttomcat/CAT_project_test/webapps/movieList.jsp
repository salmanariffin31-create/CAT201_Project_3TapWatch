<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tapwatch.model.Movie" %>

<html>
<body>

<h1>Movie Catalog</h1>

<%
    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
%>

<ul>
    <% for (Movie m : movies) { %>
    <li>
        <strong><%= m.getTitle() %></strong> —
        <%= m.getGenre() %> —
        RM <%= m.getPrice() %>
    </li>
    <% } %>
</ul>

</body>
</html>
