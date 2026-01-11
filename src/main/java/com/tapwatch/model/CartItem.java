package com.tapwatch.model;

public class CartItem {
    private Movie movie;
    private int quantity;
    private String type; // "buy" or "rent"

    public CartItem(Movie movie, int quantity, String type) {
        this.movie = movie;
        this.quantity = quantity;
        this.type = type;
    }

    public Movie getMovie() {
        return movie;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getType() {
        return type;
    }

    public double getSubtotal() {
        if ("rent".equalsIgnoreCase(type)) {
            return movie.getRentPrice() * quantity;
        }
        return movie.getPrice() * quantity;
    }
}