package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Movie;
import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "movies", urlPatterns = {"/movies"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 15 // 15MB
)
public class MovieCTL extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Movie> movies = new ArrayList<>();

        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "SELECT * FROM movies";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Movie movie = new Movie();
                    movie.setId(rs.getInt("movie_id"));
                    movie.setTitle(rs.getString("title"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setDescription(rs.getString("description"));
                    movie.setImdb_rating(rs.getFloat("imdb_rating"));
                    movie.setDuration(rs.getTime("duration"));
                    movie.setRelease_date(rs.getDate("release_date"));
                    movie.setImage_path(rs.getString("image_path"));
                    movie.setStatus(rs.getString("status"));
                    movie.setActors(rs.getString("actors"));
                    movie.setCharacters(rs.getString("characters"));
                    movie.setDirector(rs.getString("director"));
                    movie.setProduce(rs.getString("produce"));
                    movie.setWriter(rs.getString("writer"));
                    movie.setMusic(rs.getString("music"));
                    movies.add(movie);
                }
            }

        } catch (SQLException e) {
            Logger.getLogger(MovieCTL.class.getName()).log(Level.SEVERE, "Error fetching movies", e);
            request.setAttribute("error", "Failed to load movies. Please try again later.");
        } catch (Exception ex) {
            Logger.getLogger(MovieCTL.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("error", "An unexpected error occurred.");
        }

        request.setAttribute("movies", movies);         // All movies

        // Forward to index.jsp once
        request.getRequestDispatcher("/movies.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is admin
        String role = (String) request.getSession().getAttribute("role");
        if (!"admin".equals(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            return;
        }

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    addMovie(request);
                    request.setAttribute("success", "Movie added successfully!");
                    break;
                case "edit":
                    updateMovie(request);
                    request.setAttribute("success", "Movie updated successfully!");
                    break;
                case "delete":
                    deleteMovie(request);
                    request.setAttribute("success", "Movie deleted successfully!");
                    break;
                default:
                    request.setAttribute("error", "Invalid action specified.");
            }
        } catch (Exception e) {
            Logger.getLogger(MovieCTL.class.getName()).log(Level.SEVERE, "Error processing Movie action", e);
            request.setAttribute("error", "Failed to process request: " + e.getMessage());
        }

        doGet(request, response);
    }

    private void addMovie(HttpServletRequest request) throws Exception {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String description = request.getParameter("description");
        String imdb_rating = request.getParameter("imdb_rating");
        String duration = request.getParameter("duration");
        String release_date = request.getParameter("release_date");
        String status = request.getParameter("status");
        String actors = request.getParameter("actors");
        String characters = request.getParameter("characters");
        String director = request.getParameter("director");
        String produce = request.getParameter("produce");
        String writer = request.getParameter("writer");
        String music = request.getParameter("music");
        String image_path = processImageUpload(request);

        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "INSERT INTO movies (title, genre, description, imdb_rating, duration, release_date, image_path, status, actors, characters, director, produce, writer, music) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, title);
                stmt.setString(2, genre);
                stmt.setString(3, description);
                stmt.setString(4, imdb_rating);
                stmt.setString(5, duration);
                stmt.setString(6, release_date);
                stmt.setString(7, image_path);
                stmt.setString(8, status);
                stmt.setString(9, actors);
                stmt.setString(10, characters);
                stmt.setString(11, director);
                stmt.setString(12, produce);
                stmt.setString(13, writer);
                stmt.setString(14, music);
                stmt.executeUpdate();
            }
        }
    }

    private void updateMovie(HttpServletRequest request) throws Exception {
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String description = request.getParameter("description");
        String imdb_rating = request.getParameter("imdb_rating");
        String duration = request.getParameter("duration");
        String release_date = request.getParameter("release_date");
        String status = request.getParameter("status");
        String actors = request.getParameter("actors");
        String characters = request.getParameter("characters");
        String director = request.getParameter("director");
        String produce = request.getParameter("produce");
        String writer = request.getParameter("writer");
        String music = request.getParameter("music");

        // First get the old image path
        String oldImagePath = null;
        try (Connection conn = JDBCDataSource.getConnection()) {
            String selectSql = "SELECT image_path FROM movies WHERE movie_id = ?";
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                selectStmt.setInt(1, movieId);
                ResultSet rs = selectStmt.executeQuery();
                if (rs.next()) {
                    oldImagePath = rs.getString("image_path");
                }
            }
        }

        // Process new image if uploaded
        String newImagePath = processImageUpload(request);

        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = newImagePath != null
                    ? "UPDATE movies SET title = ?, genre = ?, description = ?, imdb_rating = ?, duration = ?, release_date = ?, status = ?, actors = ?, characters = ?, director = ?, produce = ?, writer = ?, music = ?, image_path = ? WHERE movie_id = ?"
                    : "UPDATE movies SET title = ?, genre = ?, description = ?, imdb_rating = ?, duration = ?, release_date = ?, status = ?, actors = ?, characters = ?, director = ?, produce = ?, writer = ?, music = ? WHERE movie_id = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, title);
                stmt.setString(2, genre);
                stmt.setString(3, description);
                stmt.setString(4, imdb_rating);
                stmt.setString(5, duration);
                stmt.setString(6, release_date);
                stmt.setString(7, status);
                stmt.setString(8, actors);
                stmt.setString(9, characters);
                stmt.setString(10, director);
                stmt.setString(11, produce);
                stmt.setString(12, writer);
                stmt.setString(13, music);
                if (newImagePath != null) {
                    stmt.setString(14, newImagePath);
                    stmt.setInt(15, movieId);
                    // Delete old image after successful update
                    if (oldImagePath != null) {
                        deleteImage(oldImagePath);
                    }
                } else {
                    stmt.setInt(14, movieId);
                }
                stmt.executeUpdate();
            }
        }
    }

    private void deleteMovie(HttpServletRequest request) throws Exception {
        int movieId = Integer.parseInt(request.getParameter("movieId"));

        try (Connection conn = JDBCDataSource.getConnection()) {
            // First, get the image path to delete the file
            String selectSql = "SELECT image_path FROM movies WHERE movie_id = ?";
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                selectStmt.setInt(1, movieId);
                ResultSet rs = selectStmt.executeQuery();
                if (rs.next()) {
                    String image_path = rs.getString("image_path");
                    if (image_path != null) {
                        deleteImage(image_path);
                    }
                }
            }

            // Then delete the movie record
            String sql = "DELETE FROM movies WHERE movie_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, movieId);
                stmt.executeUpdate();
            }
        }
    }

    private String processImageUpload(HttpServletRequest request) throws Exception {
        Part filePart = request.getPart("image");
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        // Create upload directory if it doesn't exist
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Generate unique filename
        String fileTitle = UUID.randomUUID().toString() + getFileExtension(filePart);
        String filePath = uploadPath + File.separator + fileTitle;

        // Save file
        filePart.write(filePath);

        // Return relative path for database storage
        return "./" + UPLOAD_DIRECTORY + "/" + fileTitle;
    }

    private String getFileExtension(Part part) {
        String submittedFileTitle = part.getSubmittedFileName();
        return submittedFileTitle.substring(submittedFileTitle.lastIndexOf("."));
    }

    private void deleteImage(String image_path) {
        if (image_path != null && !image_path.isEmpty()) {
            String fullPath = getServletContext().getRealPath("") + image_path.substring(1);
            File imageFile = new File(fullPath);
            if (imageFile.exists()) {
                imageFile.delete();
            }
        }
    }
}
