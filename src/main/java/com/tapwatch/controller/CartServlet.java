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

        HttpSession session = req.getSession();

        // Access Control: Redirect to login if not logged in
        if (session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp?error=loginRequired");
            return;
        }

        // Get or create cart from session
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

        HttpSession session = req.getSession();

        // Access Control: Redirect to login if not logged in
        if (session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp?error=loginRequired");
            return;
        }

        String action = req.getParameter("action");

        // Get or create cart
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if ("add".equals(action)) {

            int movieId = Integer.parseInt(req.getParameter("movieId"));
            String type = req.getParameter("type");
            if (type == null || type.isEmpty()) {
                type = "buy";
            }
            int quantity;

            try {
                quantity = Integer.parseInt(req.getParameter("quantity"));
                if (quantity < 1)
                    quantity = 1;
            } catch (NumberFormatException e) {
                quantity = 1;
            }

            MovieDAO dao = new MovieDAO();
            Movie movie = dao.getMovieById(movieId);

            if (movie != null) {
                cart.addItem(movie, quantity, type);

                // store success message in session
                String actionText = "rent".equals(type) ? "rented" : "added to cart";
                session.setAttribute("message",
                        movie.getTitle() + " " + actionText + "!");
            }

            // redirect BACK to movie list
            resp.sendRedirect("movies");
        } else if ("remove".equals(action)) {
            String itemKey = req.getParameter("itemKey");
            if (itemKey != null) {
                cart.removeItem(itemKey);
            }
            resp.sendRedirect("cart");
        } else if ("update".equals(action)) {
            String itemKey = req.getParameter("itemKey");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            if (itemKey != null) {
                cart.updateQuantity(itemKey, quantity);
            }
            resp.sendRedirect("cart");
        }
    }
}
