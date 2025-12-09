package com.tapwatch.model;

public class Movie {
    private int id;
    private String title;
    private String genre;
    private double price;
    private String description;
    private String imagePath;

    public Movie(int id, String title, String genre, double price, String description, String imagePath) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.price = price;
        this.description = description;
        this.imagePath = imagePath;
    }

    // Getters only (no need for setters unless you want)
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getGenre() { return genre; }
    public double getPrice() { return price; }
    public String getDescription() { return description; }
    public String getImagePath() { return imagePath; }
}
