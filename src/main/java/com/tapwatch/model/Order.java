package com.tapwatch.model;

import java.util.List;

public class Order {
    private String orderId;
    private String username;
    private String orderDate;
    private double total;
    private List<CartItem> items;

    public Order(String orderId, String username, String orderDate, double total, List<CartItem> items) {
        this.orderId = orderId;
        this.username = username;
        this.orderDate = orderDate;
        this.total = total;
        this.items = items;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getUsername() {
        return username;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public double getTotal() {
        return total;
    }

    public List<CartItem> getItems() {
        return items;
    }
}
