package com.tapwatch.controller;

import com.tapwatch.model.Cart;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect("cart");
            return;
        }

        // In a real app, you'd save the order to a database here
        // For now, just store the order details in the session

        double total = cart.getTotal();
        String orderDate = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        req.setAttribute("orderDate", orderDate);
        req.setAttribute("orderTotal", total);
        req.setAttribute("itemCount", cart.getItemCount());

        // Clear the cart after checkout
        cart.clear();

        // Forward to confirmation page
        RequestDispatcher rd = req.getRequestDispatcher("checkout-confirmation.jsp");
        rd.forward(req, resp);
    }
}