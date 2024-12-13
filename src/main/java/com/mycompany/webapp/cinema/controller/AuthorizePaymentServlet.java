
package com.mycompany.webapp.cinema.controller;

import com.mycompany.webapp.cinema.model.OrderDetails;
import com.mycompany.webapp.cinema.model.PaymentServices;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.paypal.base.rest.PayPalRESTException;

@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AuthorizePaymentServlet() {
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movie = request.getParameter("movieName");
        String subtotal = request.getParameter("subtotal");
        String tax = request.getParameter("tax");
        String total = request.getParameter("total");

        // Validate input
        if (movie == null || subtotal == null || tax == null || total == null) {
            request.setAttribute("errorMessage", "Invalid input data.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        // Create order detail object
        OrderDetails orderDetail = new OrderDetails(movie, subtotal, tax, total);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);

            // Redirect to PayPal for approval
            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
