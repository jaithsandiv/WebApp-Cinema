package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Feedback;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "feedback", urlPatterns = {"/feedback"})
public class FeedbackCTL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user is an admin
        if ("admin".equals(request.getSession().getAttribute("role"))) {
            // Fetch all feedbacks from the database
            String sql = "SELECT * FROM feedback";
            try (Connection con = JDBCDataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                List<Feedback> feedbackList = new ArrayList<>();
                while (rs.next()) {
                    Feedback feedback = new Feedback();
                    feedback.setFeedbackId(rs.getInt("feedback_id"));
                    feedback.setRating(rs.getInt("rating"));
                    feedback.setComment(rs.getString("comment"));
                    feedbackList.add(feedback);
                }
                request.setAttribute("feedbacks", feedbackList);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String comment = request.getParameter("comment");
        String ratingStr = request.getParameter("rating");

        if (ratingStr == null || ratingStr.isEmpty()) {
            // Handle the error, e.g., redirect back to the form with an error message
            request.setAttribute("error", "Rating is required.");
            request.getRequestDispatcher("/feedback.jsp").forward(request, response);
            return;
        }

        int rating = Integer.parseInt(ratingStr); // Retrieve rating

        Feedback feedback = new Feedback();
        feedback.setComment(comment);
        feedback.setRating(rating); // Set rating

        // Database logic directly in the servlet
        String sql = "INSERT INTO feedback (comment, rating) VALUES (?, ?)";

        try (Connection con = JDBCDataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, comment);
            ps.setInt(2, rating); // Set rating

            boolean addFeedback = false;

            int rowsInserted = ps.executeUpdate();

            // Get the generated feedback_id (auto-incremented)
            if (rowsInserted > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    feedback.setFeedbackId(generatedKeys.getInt(1));
                }
                addFeedback = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward to feedback.jsp with success message
        request.setAttribute("success", "Thank you for your feedback!");
        request.getRequestDispatcher("/feedback.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for user feedback";
    }

}
