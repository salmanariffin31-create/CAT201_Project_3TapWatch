import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    // This list acts as our temporary database
    private static List<Movie> movieList = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            // Find the movie and send it to the edit page
            Movie existingMovie = movieList.stream().filter(m -> m.getId() == id).findFirst().orElse(null);
            request.setAttribute("movie", existingMovie);
            request.getRequestDispatcher("edit-movie.jsp").forward(request, response);
            return;
        }

        // Handle DELETE action
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            movieList.removeIf(m -> m.getId() == id);
        }

        // Send the list to the JSP page
        request.setAttribute("movies", movieList);
        request.getRequestDispatcher("admin-panel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if ("update".equals("action")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            double price = Double.parseDouble(request.getParameter("price"));

            for (Movie m : movieList) {
                if (m.getId() == id) {
                    // Update the movie details
                    movieList.set(movieList.indexOf(m), new Movie(id, title, genre, price));
                    break;
                }
            }
        } else {
        // Handle ADD action
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        double price = Double.parseDouble(request.getParameter("price"));

        int newId = movieList.size() + 1;
        movieList.add(new Movie(newId, title, genre, price));
    }
        // Redirect back to the display page
        response.sendRedirect("admin");
    }
}