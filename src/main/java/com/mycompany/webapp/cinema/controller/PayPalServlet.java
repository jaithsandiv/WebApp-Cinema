package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.utility.PayPalConfig;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PayPalServlet", urlPatterns = {"/pay"})
public class PayPalServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedSeats = request.getParameter("selectedSeats");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        int showtimeId = Integer.parseInt(request.getParameter("showtime_id"));

        APIContext apiContext = PayPalConfig.getAPIContext();

        // Create payment
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.format("%.2f", totalPrice));

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("Movie Tickets Booking");

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/WebApp-Cinema/");
        redirectUrls.setReturnUrl("http://localhost:8080/WebApp-Cinema/ExecutePaymentServlet");

        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(payer);
        payment.setTransactions(transactions);
        payment.setRedirectUrls(redirectUrls);

        try {
            Payment createdPayment = payment.create(apiContext);

            // Save selectedSeats and showtimeId in session for later use
            request.getSession().setAttribute("selectedSeats", selectedSeats);
            request.getSession().setAttribute("totalPrice", totalPrice);
            request.getSession().setAttribute("showtime_id", showtimeId);

            // Redirect to PayPal approval URL
            for (Links link : createdPayment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    response.sendRedirect(link.getHref());
                    return;
                }
            }
        } catch (PayPalRESTException e) {
            throw new ServletException("Error creating PayPal payment", e);
        }
    }
}
