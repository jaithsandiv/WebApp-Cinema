package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "bookingdetails", urlPatterns = {"/bookingdetails"})
public class BookingDetailsCTL extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");

        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "SELECT * FROM booking WHERE BookingID = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(bookingID));

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                // Generate the link to the JSP page
                String baseURL = request.getRequestURL().toString().replace(request.getServletPath(), "");
                String jspLink = baseURL + "/bookingDetails.jsp?bookingID=" + bookingID;

                // Assuming the user's email is part of the booking record
                String userEmail = "chanodyapraveen@gmail.com"; // Replace with actual field if available
                if (rs.getString("Email") != null) {
                    userEmail = rs.getString("Email");
                }

                // Create the email content
                String emailContent = "<h1>Your E-Ticket</h1>"
                        + "<p>Click the link below to view your e-ticket:</p>"
                        + "<a href='" + jspLink + "'>" + jspLink + "</a>";

                // Send the email
                EmailSenderCTL.sendEmailWithHtml("chanodyapraveen", "Your E-Ticket", emailContent);

                // Respond with confirmation
                response.getWriter().println("E-ticket link sent to: " + userEmail);
            } else {
                response.getWriter().println("Booking not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Booking details controller to generate e-ticket link and send via email.";
    }
}
