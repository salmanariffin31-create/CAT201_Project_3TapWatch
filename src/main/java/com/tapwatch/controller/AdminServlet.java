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

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private MovieDAO movieDAO = new MovieDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Movie movie = movieDAO.getMovieById(id);
            req.setAttribute("movie", movie);
            req.getRequestDispatcher("edit-movie.jsp").forward(req, resp);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            movieDAO.deleteMovie(id);
            resp.sendRedirect("admin");
        } else {
            // List all movies
            List<Movie> movies = movieDAO.getAllMovies();
            req.setAttribute("movies", movies);

            // List all orders
            com.tapwatch.dao.OrderDAO orderDAO = new com.tapwatch.dao.OrderDAO();
            List<com.tapwatch.model.Order> orders = orderDAO.getAllOrders();
            req.setAttribute("orders", orders);

            req.getRequestDispatcher("admin-panel.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String genre = req.getParameter("genre");
            double price = Double.parseDouble(req.getParameter("price"));

            Movie existing = movieDAO.getMovieById(id);
            if (existing != null) {
                existing.setTitle(title);
                existing.setGenre(genre);
                existing.setPrice(price);
                movieDAO.updateMovie(existing);
            }
        } else {
            // Add new movie
            String title = req.getParameter("title");
            String genre = req.getParameter("genre");
            String posterUrl = req.getParameter("posterUrl");
            double price = Double.parseDouble(req.getParameter("price"));

            Movie newMovie = new Movie();
            newMovie.setTitle(title);
            newMovie.setGenre(genre);
            newMovie.setPrice(price);

            if (posterUrl != null && !posterUrl.trim().isEmpty()) {
                newMovie.setPosterUrl(posterUrl);
            } else {
                newMovie.setPosterUrl("images/placeholder.png");
            }

            newMovie.setDescription("New added movie.");

            movieDAO.addMovie(newMovie);
            req.getSession().setAttribute("message", "Movie added successfully!");
        }

        resp.sendRedirect("admin");
    }
}
