package com.tapwatch.controller;

import com.tapwatch.dao.MovieDAO;
import com.tapwatch.dao.OrderDAO;
import com.tapwatch.model.CartItem;
import com.tapwatch.model.Movie;
import com.tapwatch.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/watch")
public class WatchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            int movieId = Integer.parseInt(req.getParameter("id"));

            // Check ownership
            OrderDAO orderDAO = new OrderDAO();
            List<Order> orders = orderDAO.getOrdersByUsername(username);
            boolean ownsMovie = false;

            for (Order order : orders) {
                for (CartItem item : order.getItems()) {
                    if (item.getMovie().getId() == movieId) {
                        ownsMovie = true;
                        break;
                    }
                }
                if (ownsMovie)
                    break;
            }

            if (ownsMovie) {
                MovieDAO movieDAO = new MovieDAO();
                Movie movie = movieDAO.getMovieById(movieId);
                req.setAttribute("movie", movie);
                req.getRequestDispatcher("watch.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("details?id=" + movieId);
            }

        } catch (NumberFormatException e) {
            resp.sendRedirect("movies");
        }
    }
}
