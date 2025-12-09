package com.tapwatch.controller;

import com.tapwatch.dao.MovieDAO;
import com.tapwatch.model.Movie;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/movies")
public class MovieListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        MovieDAO dao = new MovieDAO();
        List<Movie> movies = dao.getAllMovies();

        // Send data to JSP
        req.setAttribute("movies", movies);

        // Display movieList.jsp
        RequestDispatcher rd = req.getRequestDispatcher("movieList.jsp");
        rd.forward(req, resp);
    }
}
