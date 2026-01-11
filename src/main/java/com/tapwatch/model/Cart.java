package com.tapwatch.model;

import java.util.*;

public class Cart {
    private Map<String, CartItem> items; // key = movieId + "-" + type

    public Cart() {
        this.items = new HashMap<>();
    }

    public void addItem(Movie movie, int quantity, String type) {
        String key = movie.getId() + "-" + type;
        if (items.containsKey(key)) {
            CartItem existing = items.get(key);
            existing.setQuantity(existing.getQuantity() + quantity);
        } else {
            items.put(key, new CartItem(movie, quantity, type));
        }
    }

    public void removeItem(String itemKey) {
        items.remove(itemKey);
    }

    public void updateQuantity(String itemKey, int quantity) {
        if (quantity <= 0) {
            removeItem(itemKey);
        } else if (items.containsKey(itemKey)) {
            items.get(itemKey).setQuantity(quantity);
        }
    }

    public Map<String, CartItem> getItemsMap() {
        return items;
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