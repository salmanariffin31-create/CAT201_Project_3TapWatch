<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>

<h2>Welcome, <%= user %>!</h2>

<a href="LogoutServlet">Logout</a>

</body>
</html>