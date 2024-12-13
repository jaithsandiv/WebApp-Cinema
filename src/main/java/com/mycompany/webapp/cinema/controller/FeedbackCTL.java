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

@WebServlet(name = "feedback", urlPatterns = {"/feedback"})
public class FeedbackCTL extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("user_id")); // Should be passed in the form
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");

        Feedback feedback = new Feedback();
        feedback.setUserId(userId);
        feedback.setRating(rating);
        feedback.setComments(comments);

        String sql = "INSERT INTO feedback (user_id, rating, comments) VALUES (?, ?, ?)";

        try (Connection con = JDBCDataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, feedback.getUserId());
            ps.setInt(2, feedback.getRating());
            ps.setString(3, feedback.getComments());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("feedback.jsp?success=true");
    }

    @Override
    public String getServletInfo() {
        return "Servlet for submitting user feedback";
    }
}
