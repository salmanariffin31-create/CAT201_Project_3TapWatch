package com.tapwatch.controller;

import com.tapwatch.dao.MovieDAO;
import com.tapwatch.model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieServlet", urlPatterns = {"/movies", "/details"})
public class MovieServlet extends HttpServlet {

    private MovieDAO movieDAO;

    @Override
    public void init() throws ServletException {
        movieDAO = new MovieDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();

        // ===== MOVIE DETAILS =====
        if ("/details".equals(path)) {
            String idStr = req.getParameter("id");

            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                Movie movie = movieDAO.getMovieById(id);

                req.setAttribute("movie", movie);
                req.getRequestDispatcher("movie-details.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("movies");
            }

            // ===== MOVIE CATALOG =====
        } else {
            String search = req.getParameter("search");
            String genre = req.getParameter("genre");

            List<Movie> movies;

            if ((search != null && !search.isEmpty()) ||
                    (genre != null && !genre.isEmpty())) {

                movies = movieDAO.getMoviesByCriteria(search, genre);
            } else {
                movies = movieDAO.getAllMovies();
            }

            req.setAttribute("movies", movies);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}

