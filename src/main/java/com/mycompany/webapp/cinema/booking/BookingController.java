package com.mycompany.webapp.cinema.booking;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BookingController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Sample data (replace with database query)
        List<Booking> bookings = new ArrayList<>();
        bookings.add(new Booking(14383, "Segway Tour of Washington, D.C.", "Tour", 200.00, "Completed"));
        bookings.add(new Booking(14386, "American Parks Trail", "Tour", 150.00, "Incomplete"));

        // Set data as request attribute
        request.setAttribute("bookings", bookings);

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("booking-history.jsp");
        dispatcher.forward(request, response);
    }
}
