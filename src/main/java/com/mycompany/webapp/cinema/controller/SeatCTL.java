package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.Seat;
import com.mycompany.webapp.cinema.utility.JDBCDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SeatSelectionServlet", urlPatterns = {"/seat-selection"})
public class SeatCTL extends HttpServlet {

    private final static JDBCDataSource jdbcDataSource;

    static {
        try {
            jdbcDataSource = JDBCDataSource.getInstance();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int showtimeId = Integer.parseInt(req.getParameter("showtime_id"));
            req.setAttribute("seatDetails", getBookedSeats(showtimeId));
        } catch (Exception e) {
            req.setAttribute("error", "Error retrieving seat details: " + e.getMessage());
            req.getRequestDispatcher("./seatselections.jsp").forward(req, resp);
            return;
        }
        req.getRequestDispatcher("/seatselections.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            resp.sendRedirect("login");
            return;
        }

        try {
            String[] selectedSeats = req.getParameter("selectedSeats").split(",");
            int showtimeId = Integer.parseInt(req.getParameter("showtime_id"));
            List<Seat> currentBookedSeats = getBookedSeats(showtimeId);

            // Check if any of the selected seats are already booked or temporarily booked
            for (String seatNumber : selectedSeats) {
                for (Seat seat : currentBookedSeats) {
                    if (seat.getSeatNumber().equals(seatNumber) && (seat.getSeatStatus().equals("Booked") || seat.getSeatStatus().equals("Temp Booked"))) {
                        req.setAttribute("error", "One or more selected seats are already booked or temporarily booked.");
                        req.setAttribute("showtime_id", showtimeId);
                        req.getRequestDispatcher("/seatselections.jsp").forward(req, resp);
                        return;
                    }
                }
            }

            addTempBookSeats(selectedSeats, showtimeId);
            req.setAttribute("selectedSeats", req.getParameter("selectedSeats"));
            req.setAttribute("totalPrice", req.getParameter("totalPrice"));
            req.setAttribute("showtime_id", req.getParameter("showtime_id"));
        } catch (Exception e) {
            req.setAttribute("error", "Error processing seat selection: " + e.getMessage());
            req.getRequestDispatcher("/seatselections.jsp").forward(req, resp);
            return;
        }
        req.getRequestDispatcher("/ForwardToPaymentServlet").forward(req, resp);
    }

    public List<Seat> getBookedSeats(int showtimeId) throws Exception {
        List<Seat> seats = new ArrayList<>();
        seats.addAll(getTempBookedSeats(showtimeId));
        seats.addAll(getBookedSeatsFromBookings(showtimeId));
        return seats;
    }

    private List<Seat> getTempBookedSeats(int showtimeId) throws Exception {
        List<Seat> seats = new ArrayList<>();
        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "SELECT seat_number, 'Temp Booked' AS seat_status FROM temp_seats WHERE showtime_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, showtimeId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        seats.add(new Seat(rs.getString(1), showtimeId, rs.getString(2)));
                    }
                }
            }
        } catch (Exception e) {
            throw new Exception("Error retrieving temporarily booked seats.", e);
        }
        return seats;
    }

    private List<Seat> getBookedSeatsFromBookings(int showtimeId) throws Exception {
        List<Seat> seats = new ArrayList<>();
        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "SELECT seat_numbers FROM bookings WHERE showtime_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, showtimeId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        String[] seatNumbers = rs.getString(1).split(",");
                        for (String seatNumber : seatNumbers) {
                            seats.add(new Seat(seatNumber, showtimeId, "Booked"));
                        }
                    }
                }
            }
        } catch (Exception e) {
            throw new Exception("Error retrieving booked seats.", e);
        }
        return seats;
    }

    public void addTempBookSeats(String[] seatNumbers, int showtimeId) throws Exception {
        try (Connection conn = JDBCDataSource.getConnection()) {
            String sql = "INSERT INTO temp_seats (seat_number, showtime_id) VALUES (?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                for (String seatNumber : seatNumbers) {
                    stmt.setString(1, seatNumber);
                    stmt.setInt(2, showtimeId);
                    stmt.addBatch();
                }
                stmt.executeBatch();
            }
        } catch (Exception e) {
            throw new Exception("Error adding temporarily booked seats.", e);
        }
    }
}
