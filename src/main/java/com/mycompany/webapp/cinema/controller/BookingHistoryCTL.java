package com.mycompany.moviebooking.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.mycompany.moviebooking.model.User;
import com.mycompany.moviebooking.utility.JDBCDataSource;
import com.mycompany.moviebooking.model.Booking;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "account", urlPatterns = {"/account"})
public class AccountCTL extends HttpServlet {
    
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
                request.setAttribute("username",rs.getString("username"));
                request.setAttribute("email",rs.getString("email"));
                request.setAttribute("phone",rs.getString("phone"));
            }
            fetchBookingHistory(conn, user_id, request);
        } catch (SQLException e) {
            request.setAttribute("error", "Failed to fetch user details");
        } catch (Exception ex) {
            Logger.getLogger(AccountCTL.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("account.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer user_id = (Integer) session.getAttribute("user_id");
        
        if (user_id == null) {
            response.sendRedirect("login");
            return;
        }
        
        String formType = request.getParameter("formType"); // Add hidden input to identify form
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        try (Connection conn = JDBCDataSource.getConnection()) {
            // Handle user info update
            if ("userInfo".equals(formType)) {
                updateUserInfo(conn, user_id, email, phone, request);
            }
            // Handle password update
            else if ("password".equals(formType)) {
                updatePassword(conn, user_id, currentPassword, newPassword, request);
            }
            // Handle account deletion
            else if ("deleteAccount".equals(formType)) {
                deleteAccount(conn, user_id, request);
                session.invalidate(); // Invalidate session after account deletion
                response.sendRedirect("index"); // Redirect to home page after deletion
                return;
            }            
        } catch (SQLException e) {
            request.setAttribute("error", "Database error occurred");
        } catch (Exception ex) {
            request.setAttribute("error", "Something went wrong, please try again later.");
            Logger.getLogger(AccountCTL.class.getName()).log(Level.SEVERE, null, ex);
        }
        doGet(request, response);
    }

    private void updateUserInfo(Connection conn, int user_id, String email, String phone, HttpServletRequest request) 
            throws SQLException {
        if (email != null && !email.isEmpty() || phone != null && !phone.isEmpty()) {
            String sql = "UPDATE users SET email = ?, phone = ? WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, phone);
            stmt.setInt(3, user_id);
            stmt.executeUpdate();
            request.setAttribute("success", "User information updated successfully");
        }
    }

    private void updatePassword(Connection conn, int user_id, String currentPassword, String newPassword, 
            HttpServletRequest request) throws SQLException {
        if (currentPassword != null && newPassword != null) {
            String checkPwd = "SELECT password FROM users WHERE user_id = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkPwd);
            checkStmt.setInt(1, user_id);
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next() && rs.getString("password").equals(currentPassword)) {
                String sql = "UPDATE users SET password = ? WHERE user_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, newPassword);
                stmt.setInt(2, user_id);
                stmt.executeUpdate();
                request.setAttribute("success", "Password updated successfully");
            } else {
                request.setAttribute("error", "Current password is incorrect");
            }
        }
    }

    private void deleteAccount(Connection conn, int user_id, HttpServletRequest request) throws SQLException {
        String sql = "DELETE FROM users WHERE user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, user_id);
        stmt.executeUpdate();
        request.setAttribute("success", "Account deleted successfully");
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

}
