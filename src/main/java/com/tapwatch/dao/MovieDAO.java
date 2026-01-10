package com.tapwatch.dao;

import com.tapwatch.model.Movie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM movies ORDER BY id DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Movie movie = mapResultSetToMovie(rs);
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public List<Movie> getMoviesByCriteria(String search, String genre) {
        List<Movie> movies = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM movies WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (search != null && !search.trim().isEmpty()) {
            sql.append(" AND title LIKE ?");
            params.add("%" + search.trim() + "%");
        }
        
        if (genre != null && !genre.trim().isEmpty() && !"All".equalsIgnoreCase(genre)) {
            sql.append(" AND genre LIKE ?");
            params.add("%" + genre.trim() + "%");
        }
        
        sql.append(" ORDER BY id DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
            
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    movies.add(mapResultSetToMovie(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }
    public Movie getMovieById(int id) {
        String sql = "SELECT * FROM movies WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToMovie(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Admin methods
    public boolean addMovie(Movie movie) {
        String sql = "INSERT INTO movies (title, genre, year, duration, rating, description, poster_url, trailer_url, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstSetMovieParams(pstmt, movie);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateMovie(Movie movie) {
        String sql = "UPDATE movies SET title=?, genre=?, year=?, duration=?, rating=?, description=?, poster_url=?, trailer_url=?, price=? WHERE id=?";
         try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstSetMovieParams(pstmt, movie);
            pstmt.setInt(10, movie.getId());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteMovie(int id) {
        String sql = "DELETE FROM movies WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void pstSetMovieParams(PreparedStatement pstmt, Movie movie) throws SQLException {
        pstmt.setString(1, movie.getTitle());
        pstmt.setString(2, movie.getGenre());
        pstmt.setInt(3, movie.getYear());
        pstmt.setInt(4, movie.getDuration());
        pstmt.setDouble(5, movie.getRating());
        pstmt.setString(6, movie.getDescription());
        pstmt.setString(7, movie.getPosterUrl());
        pstmt.setString(8, movie.getTrailerUrl());
        pstmt.setDouble(9, movie.getPrice());
    }

    private Movie mapResultSetToMovie(ResultSet rs) throws SQLException {
        return new Movie(
            rs.getInt("id"),
            rs.getString("title"),
            rs.getString("genre"),
            rs.getInt("year"),
            rs.getInt("duration"),
            rs.getDouble("rating"),
            rs.getString("description"),
            rs.getString("poster_url"),
            rs.getString("trailer_url"),
            rs.getDouble("price")
        );
    }

    public Movie getMovieById(int id) {
        for (Movie movie : getAllMovies()) {
            if (movie.getId() == id) {
                return movie;
            }
        }
        return null;
    }
}
