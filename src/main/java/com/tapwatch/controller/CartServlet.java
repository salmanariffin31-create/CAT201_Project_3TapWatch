package com.tapwatch.controller;

import com.tapwatch.dao.MovieDAO;
import com.tapwatch.model.Cart;
import com.tapwatch.model.Movie;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get or create cart from session
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Forward to cart.jsp
        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        HttpSession session = req.getSession();

        // Get or create cart
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if ("add".equals(action)) {
            int movieId = Integer.parseInt(req.getParameter("movieId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            // Get movie from DAO
            MovieDAO dao = new MovieDAO();
            List<Movie> allMovies = dao.getAllMovies();
            Movie movie = allMovies.stream()
                    .filter(m -> m.getId() == movieId)
                    .findFirst()
                    .orElse(null);

            if (movie != null) {
                cart.addItem(movie, quantity);
            }

            // Redirect back to movies or cart
            resp.sendRedirect("cart");
        } else if ("remove".equals(action)) {
            int movieId = Integer.parseInt(req.getParameter("movieId"));
            cart.removeItem(movieId);
            resp.sendRedirect("cart");
        } else if ("update".equals(action)) {
            int movieId = Integer.parseInt(req.getParameter("movieId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            cart.updateQuantity(movieId, quantity);
            resp.sendRedirect("cart");
        }
    }
}
