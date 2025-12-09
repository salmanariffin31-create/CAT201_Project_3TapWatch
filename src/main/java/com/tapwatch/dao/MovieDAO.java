package com.tapwatch.dao;

import com.tapwatch.model.Movie;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    public List<Movie> getAllMovies() {
        List<Movie> list = new ArrayList<>();

        list.add(new Movie(
                1, "Inception", "Sci-Fi", 12.99,
                "A mind-bending thriller.",
                "images/inception.jpg"
        ));

        list.add(new Movie(
                2, "Joker", "Drama", 10.99,
                "A dark story of Gotham’s clown.",
                "images/joker.jpg"
        ));

        return list;
    }
}
