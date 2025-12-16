package com.tapwatch.model;

import java.util.*;

public class Cart {
    private Map<Integer, CartItem> items; // key = movieId

    public Cart() {
        this.items = new HashMap<>();
    }

    public void addItem(Movie movie, int quantity) {
        if (items.containsKey(movie.getId())) {
            CartItem existing = items.get(movie.getId());
            existing.setQuantity(existing.getQuantity() + quantity);
        } else {
            items.put(movie.getId(), new CartItem(movie, quantity));
        }
    }

    public void removeItem(int movieId) {
        items.remove(movieId);
    }

    public void updateQuantity(int movieId, int quantity) {
        if (quantity <= 0) {
            removeItem(movieId);
        } else if (items.containsKey(movieId)) {
            items.get(movieId).setQuantity(quantity);
        }
    }

    public List<CartItem> getItems() {
        return new ArrayList<>(items.values());
    }

    public double getTotal() {
        return items.values().stream()
                .mapToDouble(CartItem::getSubtotal)
                .sum();
    }

    public int getItemCount() {
        return items.values().stream()
                .mapToInt(CartItem::getQuantity)
                .sum();
    }

    public void clear() {
        items.clear();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }
}