/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Movie;
import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "information", urlPatterns = {"/information"})
public class InformationCTL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the movie ID from the query parameter
        String movieId = request.getParameter("movie_id");
        Movie movie = new Movie();

        if (movieId != null) {
            try (Connection conn = JDBCDataSource.getConnection()) {
                // Use parameterized query to avoid SQL injection
                String sqlNowShowing = "SELECT * FROM movies WHERE movie_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sqlNowShowing)) {
                    // Set the movie ID as an integer parameter
                    stmt.setInt(1, Integer.parseInt(movieId));

                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        // Populate the Movie object with data from the result set
                        movie.setId(rs.getInt("movie_id"));
                        movie.setImdb_rating(rs.getFloat("imdb_rating"));
                        movie.setTitle(rs.getString("title"));
                        movie.setGenre(rs.getString("genre"));
                        movie.setDescription(rs.getString("description"));
                        movie.setImage_path(rs.getString("image_path"));
                    } else {
                        // Handle case when no movie is found
                        request.setAttribute("error", "Movie not found for ID: " + movieId);
                    }
                }
            } catch (SQLException e) {
                Logger.getLogger(InformationCTL.class.getName()).log(Level.SEVERE, "Error fetching movie", e);
                request.setAttribute("error", "Failed to load movie details. Please try again later.");
            } catch (NumberFormatException ex) {
                Logger.getLogger(InformationCTL.class.getName()).log(Level.SEVERE, "Invalid movie ID format", ex);
                request.setAttribute("error", "Invalid movie ID format.");
            } catch (Exception ex) {
                Logger.getLogger(InformationCTL.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Set attributes to forward to the JSP
            request.setAttribute("movieTitle", movie.getTitle());
            request.setAttribute("movieDescription", movie.getDescription());
            request.setAttribute("movieImagePath", movie.getImage_path());
            request.setAttribute("imdb", movie.getImdb_rating());
            request.setAttribute("movieGenre", movie.getGenre());
            
            // Forward the request to informations.jsp
            request.getRequestDispatcher("/informations.jsp").forward(request, response);
        } else {
            // Handle missing ID
            request.setAttribute("error", "No movie ID provided.");
            request.getRequestDispatcher("/informations.jsp").forward(request, response);
        }
    }

}
