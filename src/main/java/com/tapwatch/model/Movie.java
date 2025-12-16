package com.tapwatch.model;

public class Movie {
    private int id;
    private String title;
    private String genre;
    private int year;
    private int duration;
    private double rating;
    private String description;
    private String posterUrl;
    private String trailerUrl;
    private double price;

    public Movie() {}

    public Movie(int id, String title, String genre, int year, int duration, double rating, String description, String posterUrl, String trailerUrl, double price) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.year = year;
        this.duration = duration;
        this.rating = rating;
        this.description = description;
        this.posterUrl = posterUrl;
        this.trailerUrl = trailerUrl;
        this.price = price;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getPosterUrl() { return posterUrl; }
    public void setPosterUrl(String posterUrl) { this.posterUrl = posterUrl; }

    public String getTrailerUrl() { return trailerUrl; }
    public void setTrailerUrl(String trailerUrl) { this.trailerUrl = trailerUrl; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
