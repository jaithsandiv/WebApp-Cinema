package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Movie;
import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USER
 */
@WebServlet(name = "index.jsp", urlPatterns = {"/index"})
public class HomeCTL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Movie> nowShowMovies = new ArrayList<>();
        List<Movie> comingSoonMovies = new ArrayList<>();

        try (Connection conn = JDBCDataSource.getConnection()) {
            String sqlNowShowing = "SELECT * FROM movies WHERE status='Now Showing'";
            try (PreparedStatement stmt = conn.prepareStatement(sqlNowShowing)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Movie movie = new Movie();
                    movie.setId(rs.getInt("movie_id"));
                    movie.setTitle(rs.getString("title"));
//                    theatre.setId(rs.getInt("theatre_id"));
//                    theatre.setName(rs.getString("name"));
//                    theatre.setLocation(rs.getString("location"));
                    movie.setImage_path(rs.getString("image_path"));
//                    theatres.add(theatre);
                    nowShowMovies.add(movie);
                }
            }

            String sqlComingSoon = "SELECT * FROM movies WHERE status='Coming Soon'";
            try (PreparedStatement stmt = conn.prepareStatement(sqlComingSoon)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Movie movie = new Movie();
                    movie.setId(rs.getInt("movie_id"));
                    movie.setTitle(rs.getString("title"));
//                    theatre.setId(rs.getInt("theatre_id"));
//                    theatre.setName(rs.getString("name"));
//                    theatre.setLocation(rs.getString("location"));
                    movie.setImage_path(rs.getString("image_path"));
//                    theatres.add(theatre);
                    comingSoonMovies.add(movie);
                }
            }

        } catch (SQLException e) {
            Logger.getLogger(MovieCTL.class.getName()).log(Level.SEVERE, "Error fetching movies", e);
            request.setAttribute("error", "Failed to load movies. Please try again later.");
        } catch (Exception ex) {
            Logger.getLogger(MovieCTL.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("error", "An unexpected error occurred.");
        }

        // Set both lists as request attributes
        request.setAttribute("nowshow", nowShowMovies);         // All movies
        request.setAttribute("comingsoon", comingSoonMovies);

        // Forward to index.jsp once
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

}
