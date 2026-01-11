package com.tapwatch.controller;

import com.tapwatch.dao.OrderDAO;
import com.tapwatch.model.CartItem;
import com.tapwatch.model.Order;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/library")
public class LibraryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        OrderDAO dao = new OrderDAO();
        List<Order> orders = dao.getOrdersByUsername(username);

        List<CartItem> libraryItems = new ArrayList<>();
        for (Order order : orders) {
            libraryItems.addAll(order.getItems());
        }

        req.setAttribute("libraryItems", libraryItems);
        req.getRequestDispatcher("library.jsp").forward(req, resp);
    }
}
