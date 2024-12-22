package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Theatre;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.UUID;

@WebServlet(name = "theatres", urlPatterns = {"/theatres"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 15 // 15MB
)
public class TheatreCTL extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Theatre> theatres = new ArrayList<>();

        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "SELECT * FROM theatres";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Theatre theatre = new Theatre();
                    theatre.setId(rs.getInt("theatre_id"));
                    theatre.setName(rs.getString("name"));
                    theatre.setLocation(rs.getString("location"));
                    theatre.setImagePath(rs.getString("image_path"));
                    theatre.setDescription(rs.getString("description"));
                    theatres.add(theatre);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(TheatreCTL.class.getName()).log(Level.SEVERE, "Error fetching theatres", e);
            request.setAttribute("error", "Failed to load theatres. Please try again later.");
        } catch (Exception ex) {
            Logger.getLogger(TheatreCTL.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("error", "An unexpected error occurred.");
        }

        request.setAttribute("theatres", theatres);
        request.getRequestDispatcher("/theatres.jsp").forward(request, response);
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
                    addTheatre(request);
                    request.setAttribute("success", "Theatre added successfully!");
                    break;
                case "edit":
                    updateTheatre(request);
                    request.setAttribute("success", "Theatre updated successfully!");
                    break;
                case "delete":
                    deleteTheatre(request);
                    request.setAttribute("success", "Theatre deleted successfully!");
                    break;
                default:
                    request.setAttribute("error", "Invalid action specified.");
            }
        } catch (Exception e) {
            Logger.getLogger(TheatreCTL.class.getName()).log(Level.SEVERE, "Error processing theatre action", e);
            request.setAttribute("error", "Failed to process request: " + e.getMessage());
        }

        doGet(request, response);
    }

    private void addTheatre(HttpServletRequest request) throws Exception {
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String imagePath = processImageUpload(request);

        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "INSERT INTO theatres (name, location, image_path, description) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, location);
                stmt.setString(3, imagePath);
                stmt.setString(4, description);
                stmt.executeUpdate();
            }
        }
    }

    /*
    private void updateTheatre(HttpServletRequest request) throws Exception {
        int theatreId = Integer.parseInt(request.getParameter("theatreId"));
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // First get the old image path
        String oldImagePath = null;
        try (Connection conn = JDBCDataSource.getConnection()) {
            String selectSql = "SELECT image_path FROM theatres WHERE theatre_id = ?";
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                selectStmt.setInt(1, theatreId);
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
                    ? "UPDATE theatres SET name = ?, location = ?, image_path = ? WHERE theatre_id = ?"
                    : "UPDATE theatres SET name = ?, location = ? WHERE theatre_id = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, location);
                stmt.setString(3, description);
                if (newImagePath != null) {
                    stmt.setString(3, newImagePath);
                    stmt.setInt( ,theatreId);
                    // Delete old image after successful update
                    if (oldImagePath != null) {
                        deleteImage(oldImagePath);
                    }
                } else {
                    stmt.setInt(3, theatreId);
                }
                stmt.executeUpdate();
            }
        }
    }*/
    private void updateTheatre(HttpServletRequest request) throws Exception {
        int theatreId = Integer.parseInt(request.getParameter("theatreId"));
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // First get the old image path
        String oldImagePath = null;
        try (Connection conn = JDBCDataSource.getConnection()) {
            String selectSql = "SELECT image_path FROM theatres WHERE theatre_id = ?";
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                selectStmt.setInt(1, theatreId);
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
                    ? "UPDATE theatres SET name = ?, location = ?, image_path = ?, description = ? WHERE theatre_id = ?"
                    : "UPDATE theatres SET name = ?, location = ?, description = ? WHERE theatre_id = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, location);
                if (newImagePath != null) {
                    stmt.setString(3, newImagePath);
                    stmt.setString(4, description);
                    stmt.setInt(5, theatreId);
                    // Delete old image after successful update
                    if (oldImagePath != null) {
                        deleteImage(oldImagePath);
                    }
                } else {
                    stmt.setString(3, description);
                    stmt.setInt(4, theatreId);
                }
                stmt.executeUpdate();
            }
        }
    }

    private void deleteTheatre(HttpServletRequest request) throws Exception {
        int theatreId = Integer.parseInt(request.getParameter("theatreId"));

        try (Connection conn = JDBCDataSource.getConnection()) {
            // First, get the image path to delete the file
            String selectSql = "SELECT image_path FROM theatres WHERE theatre_id = ?";
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                selectStmt.setInt(1, theatreId);
                ResultSet rs = selectStmt.executeQuery();
                if (rs.next()) {
                    String imagePath = rs.getString("image_path");
                    if (imagePath != null) {
                        deleteImage(imagePath);
                    }
                }
            }

            // Then delete the theatre record
            String sql = "DELETE FROM theatres WHERE theatre_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, theatreId);
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
        String fileName = UUID.randomUUID().toString() + getFileExtension(filePart);
        String filePath = uploadPath + File.separator + fileName;

        // Save file
        filePart.write(filePath);

        // Return relative path for database storage
        return "./" + UPLOAD_DIRECTORY + "/" + fileName;
    }

    private String getFileExtension(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        return submittedFileName.substring(submittedFileName.lastIndexOf("."));
    }

    private void deleteImage(String imagePath) {
        if (imagePath != null && !imagePath.isEmpty()) {
            String fullPath = getServletContext().getRealPath("") + imagePath.substring(1);
            File imageFile = new File(fullPath);
            if (imageFile.exists()) {
                imageFile.delete();
            }
        }
    }
}
