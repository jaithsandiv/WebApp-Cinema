package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "seatSelection", urlPatterns = {"/seatSelection"})
public class SeatSelectionCTL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the seat selection JSP page
        request.getRequestDispatcher("/seatSelection.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String[] selectedSeats = request.getParameter("selectedSeats")
                .replace("[", "").replace("]", "").replace("\"", "").split(",");
        int theatreId = Integer.parseInt(request.getParameter("theatreId"));
        int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));

        // Retrieve the logged-in user ID from the session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("login?error=unauthorized");
            return;
        }

        try (Connection con = JDBCDataSource.getConnection()) {
            // Query to fetch seat IDs for selected seats
            String seatQuery = "SELECT layout_id FROM seat_layout WHERE theatre_id = ? AND CONCAT(seat_row, seat_number) = ?";
            String bookingInsert = "INSERT INTO bookings (showtime_id, seat_id, user_id, status) VALUES (?, ?, ?, 'CONFIRMED')";

            // Begin transaction
            con.setAutoCommit(false);

            for (String seat : selectedSeats) {
                try (PreparedStatement seatStmt = con.prepareStatement(seatQuery)) {
                    seatStmt.setInt(1, theatreId);
                    seatStmt.setString(2, seat.trim());

                    ResultSet rs = seatStmt.executeQuery();
                    if (rs.next()) {
                        int seatId = rs.getInt("layout_id");

                        // Insert booking record
                        try (PreparedStatement bookingStmt = con.prepareStatement(bookingInsert)) {
                            bookingStmt.setInt(1, showtimeId);
                            bookingStmt.setInt(2, seatId);
                            bookingStmt.setInt(3, userId);
                            bookingStmt.executeUpdate();
                        }
                    } else {
                        throw new Exception("Seat not found: " + seat);
                    }
                }
            }

            // Commit transaction
            con.commit();
            // Redirect to seat selection page with success message
            response.sendRedirect("seatSelection?success=true");

        } catch (Exception e) {
            e.printStackTrace();
            // Rollback transaction in case of error
            try (Connection con = JDBCDataSource.getConnection()) {
                if (con != null) con.rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            // Redirect to seat selection page with error message
            response.sendRedirect("seatSelection?error=true");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles seat selection and booking";
    }// </editor-fold>
}
