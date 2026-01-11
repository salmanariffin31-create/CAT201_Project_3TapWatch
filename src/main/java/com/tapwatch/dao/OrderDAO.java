package com.tapwatch.dao;

import com.tapwatch.model.Order;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrderDAO {
    private static final List<Order> orders = new ArrayList<>();

    public void addOrder(Order order) {
        orders.add(order);
    }

    public List<Order> getAllOrders() {
        List<Order> reversed = new ArrayList<>(orders);
        Collections.reverse(reversed); // Show newest first
        return reversed;
    }

    public List<Order> getOrdersByUsername(String username) {
        List<Order> userOrders = new ArrayList<>();
        for (Order order : orders) {
            if (order.getUsername() != null && order.getUsername().equals(username)) {
                userOrders.add(order);
            }
        }
        Collections.reverse(userOrders); // Newest first
        return userOrders;
    }
}
