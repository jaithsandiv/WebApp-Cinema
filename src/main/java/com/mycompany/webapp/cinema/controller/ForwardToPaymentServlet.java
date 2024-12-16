/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webapp.cinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name ="ForwardToPaymentServlet", urlPatterns = {"/forwardToPayment"})
public class ForwardToPaymentServlet extends HttpServlet {
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/payment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data from test.jsp
        String selectedSeats = req.getParameter("selectedSeats");
        String totalPrice = req.getParameter("totalPrice");
        String showtimeId = req.getParameter("showtime_id");

        // Set the attributes to forward to payment.jsp
        req.setAttribute("selectedSeats", selectedSeats);
        req.setAttribute("totalPrice", totalPrice);
        req.setAttribute("showtime_id", showtimeId);

        // Forward the data to payment.jsp
        req.getRequestDispatcher("/payment.jsp").forward(req, resp);
    }
}
