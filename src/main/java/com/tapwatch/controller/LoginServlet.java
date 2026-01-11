package com.tapwatch.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Hardcoded authentication (Database removed)
        // TEMP test user: admin / 1234

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValidUser = ("admin".equals(username) && "1234".equals(password)) ||
                ("user".equals(username) && "1234".equals(password)) ||
                ("guest".equals(username) && "1234".equals(password));

        if (isValidUser) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("movies");
        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}