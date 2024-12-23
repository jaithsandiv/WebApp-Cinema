package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Booking;
import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "booking-history", urlPatterns = {"/booking-history"})
public class BookingHistoryCTL extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer user_id = (Integer) session.getAttribute("user_id");
        
        if (user_id == null) {
            response.sendRedirect("login");
            return;
        }
        
        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "SELECT * FROM users WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, user_id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Use email
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone", rs.getString("phone"));
            } else {
                request.setAttribute("error", "User  not found");
            }
            fetchBookingHistory(conn, user_id, request);
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(BookingHistoryCTL.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("error", "An unexpected error occurred");
        }
        request.getRequestDispatcher("booking-history.jsp").forward(request, response);
    }

    private void fetchBookingHistory(Connection conn, int user_id, HttpServletRequest request) throws SQLException {
        String sql = "SELECT b.booking_id, m.title AS movie_title, t.name AS theatre_name, "
                   + "CONCAT(s.show_date, ' ', s.show_time) AS showtime, b.seat_numbers, b.status "
                   + "FROM bookings b "
                   + "JOIN showtimes s ON b.showtime_id = s.showtime_id "
                   + "JOIN movies m ON s.movie_id = m.movie_id "
                   + "JOIN theatres t ON s.theatre_id = t.theatre_id "
                   + "WHERE b.user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, user_id);
        ResultSet rs = stmt.executeQuery();
        List<Booking> bookings = new ArrayList<>();
        while (rs.next()) {
            Booking booking = new Booking();
            booking.setBookingId(rs.getInt("booking_id"));
            booking.setMovieTitle(rs.getString("movie_title"));
            booking.setTheatreName(rs.getString("theatre_name"));
            booking.setShowtime(rs.getString("showtime"));
            booking.setSeatNumbers(rs.getString("seat_numbers"));
            booking.setStatus(rs.getString("status"));
            bookings.add(booking);
        }
        request.setAttribute("bookings", bookings);
    }
}